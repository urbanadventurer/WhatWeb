require 'ahocorasick'
require 'pp'
module WhatWeb
module AhoCorasick
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
        elsif match[:regexp_compiled].is_a? Regexp
          prefix=regex_to_prefix(match[:regexp_compiled])
        elsif match[:gdhb]
          prefix=match[:ghdb].split.map{|m| m.match(":") ? m.split(":").last : m.gsub('"','')}.sort{|a,b| a.size<=>b.size}.last
        end
        if prefix and prefix.strip.size>7
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
    @keyword_tree.find_all(target.body+target.headers.to_s).each do |result|
      plugins=plugins+@prefixes[result[:value]]
      plugins.uniq!
    end
    plugins=plugins+@prefixes[:other]
    ret={}
    plugins.uniq.each {|p| ret[p.plugin_name]=p}
    return ret
  end

  def self.add_match(prefix,plugin)
    unless @prefixes.has_key?(prefix) or prefix==:other
      @keyword_tree.add_string(prefix)
    end
    @prefixes[prefix]||=[]
    @prefixes[prefix] << plugin
  end

  def self.regex_to_prefix(regex)
    prefix=regex.source.scan(/(?:^|[\^+?*.(){}\[\]])([^\^+?*.(){}\[\]]*)/).map{|f| f.first}.sort{|a,b| a.size<=>b.size}.last rescue ""
    prefix.gsub!(/\\(.)/,'\\1')
    prefix.gsub!(/\\$/,'')
    prefix
  end

end
end
