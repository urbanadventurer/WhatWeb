module WhatWeb
class Scanner

  attr_reader :opener
  attr_reader :processor
  attr_reader :opts  
  def initialize(opts)
    @opener=WhatWeb::Opener.new(opts)
    @processor=WhatWeb::Processor.new(opts)
    @opts=opts.clone
    @opts[:threads]||=25
  end

  def start
    threads=[]
    results=[]
    opts[:threads].times do
      threads << Thread.new {scan_thread(results)}
    end
    threads.each {|t| t.join}
    return results unless opts[:callback_only]
    return nil
  end



  private

  def error(e)
    opts[:on_error_callback].call(e) if opts[:on_error_callback]
  end

  def scan_thread(results)
    loop do
      
      begin
        target=@opener.open_next_target
        result=@processor.process(target)
        opts[:on_result_callback].call(target,result) if opts[:on_result_callback].is_a? Proc
        results<<result unless opts[:callback_only]
      rescue WhatWeb::Opener::NoMoreTargets
        break
      rescue Exception => e
        error("Error: #{e.to_s} #{e.backtrace.join(", ")}")
      end
    end
  end

end
end
