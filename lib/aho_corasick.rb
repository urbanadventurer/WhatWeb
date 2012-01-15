require 'ahocorasick'
require 'pp'
module WhatWeb
class AhoCorasickPreprocessor

  attr_reader :opts

  def build_trigger_dictionary(opts)
    @prefixes={}
    @opts=opts.clone
    @opts[:min_trigger_size]||=5
    @prefixes[:other]=[]
    @keyword_tree=::AhoCorasick::KeywordTree.new
    @opts[:plugins].values.each do |plugin|
      prefix=nil
      matches=plugin.matches
      matches||=[]
      found_match=false
      if(plugin.trigger==:always)
        @prefixes[:other]<<plugin
        next
      elsif plugin.trigger.is_a? String
        add_match(plugin.trigger,plugin)
        next
      elsif plugin.trigger.is_a? Array
        plugin.trigger.each do |trigger|
          add_match(trigger,plugin)
        end
        next
      end
      matches.each do |match|
        if match[:text]
          prefix=match[:text]
        elsif match[:string] and !match[:string].is_a? Regexp
          prefix=match[:string]
        elsif match[:regexp_compiled].is_a? Regexp
          prefix=regex_to_prefix(match[:regexp_compiled])
        elsif match[:ghdb]
          prefix=match[:ghdb].scan(/(".*?"|\b.*?\b)/).map{|m2| m=m2.first; (m.match(":") ? m.split(":").last.to_s : m).gsub('"','')}.sort{|a,b| a.size<=>b.size}.last
        end
        if prefix and prefix.strip.size>=@opts[:min_trigger_size]
          add_match(prefix.strip,plugin)
          found_match=true
        end
      end
      if !found_match
        prefix=source_to_prefix(plugin)
        if prefix and prefix.strip.size>=@opts[:min_trigger_size]
          add_match(prefix.strip,plugin)
          found_match=true
        end
      end
      @prefixes[:other]<<plugin unless found_match
    end
    @prefixes[:other].each {|p| puts p.plugin_name if p.trigger.nil?}
    @keyword_tree.make
  end

  def find_plugins(target)
    bm=Benchmark.start(:aho_corasick) if opts[:benchmark]
    time=Time.now
    plugins=[]
    ret={}
    @keyword_tree.find_all(target.body.to_s+target.headers.to_s).each do |result|
      
      pa=@prefixes[result[:value]]
      pa.each {|p| ret[p.plugin_name]=p}
      
    end
    @prefixes[:other].each { |p| ret[p.plugin_name]=p }
    bm.finish if opts[:benchmark]
    return ret
  end

  def source_to_prefix(plugin)
    source=open(plugin.source,"r").read
    lines=source.scan(/^.*\bif\b.*=~.*$/)
    lines.each do |line|
      prefix=""
      line.scan(/=~ *\/(.*?)\//).each do |r|
        r2=regex_to_prefix(r.first)
        prefix=r2 if r2.size>prefix.size
      end
      return prefix if(prefix.strip.size>=@opts[:min_trigger_size])
    end
    return ""
  end

  def add_match(prefix,plugin)
    unless @prefixes.has_key?(prefix) or prefix==:other
      @keyword_tree.add_string(prefix)
    end
    @prefixes[prefix]||=[]
    @prefixes[prefix] << plugin unless @prefixes[prefix].include? plugin
  end

  def regex_to_prefix(regex)
    if(regex.is_a? Regexp)
      string=regex.source
    else 
      string=regex
    end
    prefix=string.scan(/([^\^+?*.(){}\[\]$]*)/).map{|f| f.first}.sort{|a,b| a.size<=>b.size}.last rescue ""
    prefix.gsub!(/\\(.)/,'\\1')
    prefix.gsub!(/\\$/,'')
    prefix
  end
end
end
