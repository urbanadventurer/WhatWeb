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

def gem_available?(gemname)
  Gem::Specification.find_by_name(gemname) ? true : false
rescue LoadError
  false
end

# check required gems
required_gems = %w[ipaddr addressable json]

missing_gems = required_gems.map.select { |g| g unless gem_available?(g) }

unless missing_gems.empty?
  puts "WhatWeb is not installed and is missing dependencies.\nThe following gems are missing:"

  missing_gems.sort.each do |g|
    puts " - #{g}"
  end

  puts "\nTo install run the following command from the WhatWeb folder:\n'bundle install'\n\n"
  exit 1
end

required_gems.each { |g| require g }

optional_gems = %w[mongo rchardet pry rb-readline]
optional_gems.each do |g|
  next unless gem_available?(g)

  begin
    require g
  rescue LoadError
    # that failed.. no big deal
    raise if $WWDEBUG == true
  end
end
