class OutputObject < Output
  
  def out(target, status, results)
    $semaphore.synchronize do
      @f.puts "Identifying: #{target.to_s}"
      @f.puts "HTTP-Status: #{status.to_s}"
      @f.puts results.pretty_inspect unless results.empty?
      @f.puts
    end
  end
end
