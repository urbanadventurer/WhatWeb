module WhatWeb
class Opener

  class NoMoreTargets < Exception
  end


  attr_reader :opts

  def initialize(opts)
    @target_list=make_target_list(opts)
    @input_file_mutex=Mutex.net
    if opts[:input_file] and File.exists?(opts[:input_file])
      @input_file=File.open(@input_file)
    end
  end


  def open_next_target
    t=next_target
    raise NoMoreTargets if t.nil?
    return open(target)
  end


  def open(target)
  end


  private


  def next_target
    @input_file_mutex.synchronize {
      if @target_list.nil? and @input_file and !@input_file.eof?
        c=0
        while(!@input_file.eof? and c<1024) do
          @target_list << @input_file.gets
          c+=1
        end
      end
    }
    t=@target_list.shift
    t=process_target(t)
    return t
  end


  def process_target(x)
    
    if File.exists?(x)
      x
    else
      if opts[:url_pattern]
        x = opts[:url_pattern].gsub('%insert%',x)
      end
      x=opts[:url_prefix] + x + opts[:url_suffix]
      if x =~ (/^[a-z]+:\/\//)
	x
      else
	x.sub(/^/,"http://")
      end
    end	
  end

  def make_target_list(opts)
	url_list = opts[:cmd_urls]
        
	# read each line as a url, skipping lines that begin with a #
	if opts[:input_file] and File.exists?(opts[:input_file])
		pp "loading input file: #{opts[:input_file]}" if $verbose > 2
		url_list += File.open(opts[:input_file]).readlines.each {|line| line.strip! }.delete_if {|line| line =~ /^#.*/ }.each {|line| line.delete!("\n") }
	end

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
     

	#make urls friendlier, test if it's a file, if test for not assume it's http://
	# http, https, ftp, etc
	url_list=url_list.map do |x|   
	end

	url_list=url_list.flatten #.sort.uniq
  end

end
end
