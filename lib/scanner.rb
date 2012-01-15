require 'pp'
module WhatWeb
class Scanner

  attr_reader :opener
  attr_reader :processor
  attr_reader :opts  
  attr_reader :threads
  def initialize(opts)
    @processor=WhatWeb::Processor.new(opts)
    @opts=opts.clone
    @opts[:threads]||=25
  end

  def start
    @threads=[]
    

    @opener=WhatWeb::Opener.new(opts)
    results=[]
    opts[:threads].times do
      parent_outgoing=IO.pipe
      parent_incoming=IO.pipe
      child=fork{ scan_thread(parent_incoming,parent_outgoing)}
      threads << [parent_incoming[0], parent_outgoing[1], child]
    #  parent_outgoing[0].close
    #  parent_incoming[1].close
    end
    @file_pile=@opener.file_pile
    @file_pile.start
    sleep 1
    @stopped=false
    
    @catcher=Thread.new { catcher }
    pitcher 
    return results unless opts[:callback_only]
    return nil
  end



  private

  def pitcher
    current=0
    while !(@file_pile.queue.empty? and @file_pile.file_pile.empty?) do
      source,body=@file_pile.next
      if source.nil?
        sleep 1
        next
      end
      r,w,c=threads[current]
      w.puts({"body"=>body,"source"=>source}.to_json)
      current+=1
      current=current % threads.size
    end

    threads.each do |t|
      r,w,c=t
      w.puts({"stop"=>true}.to_json)
    end
  end

  def catcher
    begin 
    readers=threads.map{|t| t[0]}
    while(!@stopped) do
      r, w, e=IO.select(readers,[],[])
      r.each do |rr|
        target,result=Marshal.load(rr)
        opts[:on_result_callback].call(target,result) if opts[:on_result_callback]
      end
    end
    rescue Exception => e
      puts e
    end
  end

  def error(e)
    opts[:on_error_callback].call(e) if opts[:on_error_callback]
  end

  def scan_thread(incoming,outgoing)
  #  outgoing[1].close
  #  incoming[0].close
    read=outgoing[0]
    write=incoming[1]
    loop do
      
      begin
        target=@opener.open_next_target(read)
        result=@processor.process(write,target)
      rescue Exception => e
        error("Error: #{e.to_s} #{e.backtrace.join(", ")}")
      end
    end
  end

end
end
