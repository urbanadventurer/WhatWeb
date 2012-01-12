module WhatWeb
class OutputProcessor
  def initialize(opts)
    @opts=opts
    @mutex=Mutex.new
  end

  def out(target, status, results)
    @mutex.synchronize {
      @opts[:output_plugins].each {|o| o.out(target,status,results)}
    }
  end

end
end
