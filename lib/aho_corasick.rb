require 'ahocorasick'
require 'pp'
module WhatWeb
module AhoCorasick

  MIN_TRIGGER_SIZE=4

  def self.build_prefix_dictionary
    @prefixes={}
    @prefixes[:other]=[]
    @keyword_tree=::AhoCorasick::KeywordTree.new
    ::Plugin.registered_plugins.values.each do |plugin|
      prefix=nil
      matches=plugin.matches
      matches||=[]
      found_match=false
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
        if prefix and prefix.strip.size>=MIN_TRIGGER_SIZE
          add_match(prefix.strip,plugin)
          found_match=true
        end
      end
      if !found_match
        prefix=source_to_prefix(plugin)
        if prefix and prefix.strip.size>=MIN_TRIGGER_SIZE
          add_match(prefix.strip,plugin)
          found_match=true
        end
      end
      @prefixes[:other]<<plugin unless found_match
    end
    @keyword_tree.make
  end

  def self.find_plugins(target)
    time=Time.now
    plugins=[]
    @keyword_tree.find_all(target.body.to_s+target.headers.to_s).each do |result|
      plugins=plugins+@prefixes[result[:value]]
      plugins.uniq!
    end
    plugins=plugins+@prefixes[:other]
    ret={}
    plugins.uniq.each {|p| ret[p.plugin_name]=p}
    return ret
  end

  def self.source_to_prefix(plugin)
    source=open(plugin.source,"r").read
    lines=source.scan(/^.*\bif\b.*=~.*$/)
    lines.each do |line|
      prefix=""
      line.scan(/=~ *\/(.*?)\//).each do |r|
        r2=regex_to_prefix(r.first)
        prefix=r2 if r2.size>prefix.size
      end
      return prefix if(prefix.strip.size>=MIN_TRIGGER_SIZE)
    end
    return ""
  end

  def self.add_match(prefix,plugin)
    unless @prefixes.has_key?(prefix) or prefix==:other
      @keyword_tree.add_string(prefix)
    end
    @prefixes[prefix]||=[]
    @prefixes[prefix] << plugin unless @prefixes[prefix].include? plugin
  end

  def self.regex_to_prefix(regex)
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
