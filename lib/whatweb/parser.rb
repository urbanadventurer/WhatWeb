# Copyright 2009 to 2017, Andrew Horton and Brendan Coles
#
# This file is part of WhatWeb.
#
# WhatWeb is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# at your option) any later version.
#
# WhatWeb is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with WhatWeb.  If not, see <http://www.gnu.org/licenses/>.

module WhatWeb
class Parser

  def self.run_plugins(target, plugins)
    results = []

    if plugins.empty?
      error 'No plugins selected, exiting.'
      return
    end

    plugins.each do |name, plugin|
      begin
        # eXecute the plugin
        # start_time = Time.now
        result = plugin.scan(target)
        # end_time = Time.now
        # $PLUGIN_TIMES[name] += end_time - start_time
      rescue Exception => err
        error("ERROR: Plugin #{name} failed for #{target}. #{err}")
        raise if $WWDEBUG == true
      end
      results << [name, result] unless result.nil? || result.empty?
    end
    results
  end

  def self.parse_results(target, result, logging_list, use_custom_grep_plugin)
    # results
    logging_list.each do |log|
      begin
        # Hide log if Grep plugin did not match
        if use_custom_grep_plugin
          if result.map { |plugin_name, _plugin_result| plugin_name }.include? 'Grep'
            log.out(target, target.status, result)
          end
        else
          log.out(target, target.status, result)
        end
      rescue => err
        error("ERROR Logging failed: #{target} - #{err}")
        raise if $WWDEBUG == true
      end
    end
  end
end
end
