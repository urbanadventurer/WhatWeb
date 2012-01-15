module WhatWeb
class OutputProcessor
  attr_reader :opts
  def initialize(opts)
    @opts=opts
  end

  def out(target, status, results)
    begin 
      @opts[:output_plugins].each {|o| o.out(target, status, results)}
    rescue Exception => e
      error("Error in output plugin: #{e.to_s}")
    end
  end



  def error(e)
       return if opts[:no_errors]

       if (opts[:use_colour]=="auto") or (opts[:use_colour]=="always") 
        STDERR.puts red(e) 
       else 
        STDERR.puts e
        end 
        STDERR.flush 
        unless opts[:output_errors].nil?
          opts[:output_errors].out(e.to_s)
        end
    end

end
end
