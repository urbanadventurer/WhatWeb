class LoggingObject < Logging
  def out(target, status, results)
    $semaphore.synchronize do
      @f.puts "Identifying: #{target}"
      @f.puts "HTTP-Status: #{status}"
      @f.puts results.pretty_inspect unless results.empty?
      @f.puts
    end
  end
end
