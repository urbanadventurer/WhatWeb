
module WhatWeb

class Parser

	def parse_results(target, result, output_list, use_custom_grep_plugin)
  # results
    output_list.each do |output|
	    begin

	      # Hide output if Grep plugin did not match  
	      if use_custom_grep_plugin
	        if result.map { |plugin_name, _plugin_result| plugin_name }.include? 'Grep'
	          output.out(target, target.status, result)
	        end
	      else
	        output.out(target, target.status, result)
	      end

	    rescue => err
	      error("ERROR Logging failed: #{target} - #{err}")
	      raise if $WWDEBUG == true
	    end
 	 	end


	end
end

end