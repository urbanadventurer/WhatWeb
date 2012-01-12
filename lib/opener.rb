require 'curl'
require 'uri'
module WhatWeb
class Opener

  class NoMoreTargets < Exception
  end


  attr_reader :opts

  def initialize(opts={})
    @opts=opts.clone
    @target_list=make_target_list(opts)
    @input_file_mutex=Mutex.new
    @input_file=File.open(opts[:input_file])
    @opts[:timeout]||=30
  end


  def open_next_target
    s=Time.now
    opts[:benchmark_results][:open][:runs]+=1 if opts[:benchmark]
    if @input_file
      @input_file_mutex.synchronize {
    if  @target_list.empty? and !@input_file.eof?
       c=0
       while(!@input_file.eof? and c<1024) do
          @target_list << @input_file.gets.strip
          c=c+1
        end
    end
    }
    end
    t=next_target
    raise NoMoreTargets if t.nil?
    opts[:benchmark_results][:open][:total]+=Time.now-s if opts[:benchmark]
    return open(t)
  end


  def open(target)
    if File.exists?(target)
      t=Target.new(File.open(target).read)
      t.is_file=true
      t.is_url=false
    else
		  r=::Curl::Easy.http_get(target) do |e|
			  e.header_in_body=true
			  e.follow_location=true
			  e.max_redirects=4
			  e.timeout=opts[:read_timeout]
			  e.connect_timeout=opts[:open_timeout]
			  e.resolve_mode = :ipv4
      end
      t=Target.new(r.body_str)
      t.is_file=false
      t.is_url=true
      t.uri=URI.parse(target)
		end
    t.original_source=target
    return t
  end


  private


  def next_target
    t=@target_list.shift
    t=process_target(t) unless t.nil?
    return t
  end


  def process_target(x)
    if File.exist?(x)
      x
    else
      puts "NOT file exists #{x} '#{Dir.getwd}'"
      if opts[:url_pattern]
        x = opts[:url_pattern].gsub('%insert%',x)
      end
      x=opts[:url_prefix].to_s + x + opts[:url_suffix].to_s
      if x =~ (/^[a-z]+:\/\//)
	      x
      else
	      x.sub(/^/,"http://")
      end
    end	
  end

  def make_target_list(opts)
	url_list = opts[:argv]
        

	# add example urls to url_list if required. plugins must be loaded already
	if opts[:enable_example_urls]
		url_list += pluginlist.map {|name,plugin| plugin.examples unless plugin.examples.nil? }.compact.flatten
	end

        genrange=url_list.map do |x|
	  range=nil
	  if x =~ /^[0-9\.\-*\/]+$/ and not x =~ /^[\d\.]+$/
	    # check for nmap
	    error "Target ranges require nmap to be in the path" if `which nmap` == ""
	    range=`nmap -n -sL #{x} 2>&1 | egrep -o "([0-9]{1,3}\\.){3}[0-9]{1,3}"`
	    range=range.split("\n")
	  end
	  range
	end.compact.flatten
	
	url_list= url_list.select {|x| not x =~ /^[0-9\.\-*\/]+$/ or x =~ /^[\d\.]+$/ }
	url_list += genrange unless genrange.empty?
     


	url_list=url_list.flatten #.sort.uniq
  end

end
end
