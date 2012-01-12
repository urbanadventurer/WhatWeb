module WhatWeb
class OutputProcessor
  attr_reader :opts
  def initialize(opts)
    @opts=opts
    @mutex=Mutex.new
    @err_queue=[]
    @out_queue=[]
    @thread=Thread.new { process_queue }
  end

  def process_queue
    loop do
      if @err_queue.empty? and @out_queue.empty?
        sleep 0.5
        puts 'sleep'
        next
      end
      next_err=@err_queue.shift
      next_out=@out_queue.shift
      puts_error(next_err) unless next_err.nil?
      if next_out
        begin 
          @opts[:output_plugins].each {|o| o.out(*next_out)}
        rescue Exception => e
          puts_error("Error in output plugin: #{e.to_s}")
        end
      end
    end
  end

  def out(target, status, results)
    @out_queue << [target,status,results]
  end

  def error(e)
    @err_queue << e
  end

  def puts_error(e)
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
