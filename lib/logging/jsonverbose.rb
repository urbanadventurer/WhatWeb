
# This is not JSON compliant as a list
class LoggingJSONVerbose < Logging
  def out(target, status, results)
    # brutal and simple
    $semaphore.synchronize do
      @f.puts JSON.fast_generate([target, status, results])
    end
  end
end
