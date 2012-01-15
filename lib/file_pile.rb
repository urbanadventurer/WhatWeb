module WhatWeb
class FilePile
  
  attr_reader :opts
  attr_reader :queue
  attr_reader :file_pile
  def initialize(opts)
    @opts=opts
    @opts[:file_pile_size]||=500
    @file_pile=[]
    @queue=[]
 end

  def start
    @thread=Thread.new { read_files }
    @thread.priority=2
 end

  def read_files
    loop do
      begin
      if @file_pile.length>=@opts[:file_pile_size] or @queue.empty?
        sleep 0.2
        next
      end
      f=@queue.shift
      
      @file_pile.push [f,File.open(f).read]
      rescue Exception => e
      puts e
      end
    end
  end

  def next
    @file_pile.shift
  end

end
end

