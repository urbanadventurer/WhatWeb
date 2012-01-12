module WhatWeb
module Scanner

  attr_reader :opener
  attr_reader :processor
  
  def initialize(opts)
    @opener=WhatWeb::Opener.new(opts)
    @processor=WhatWeb::Processor.new(opts)
  end

  def start
    threads=[]
    results=[]
    opts[:threads].times do
      threads << Thread.new {scan_thread(results)}
    end
    threads.each {|t| Thread.join(t)}
    return results unless opts[:callback_only]
    return nil
  end

  private

  def scan_thread(results)
    loop do
      
      begin
        raw=@opener.open_next_target
        result=@processor.process(raw)
        opts[:on_result_callback].call(result) if opts[:on_results_callback].is_a? Proc
        results<<result unless opts[:callback_only]
      rescue WhatWeb::Opener::NoMoreTargets
        break
      end
    end
  end

end
end
