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

### gem detection & loading
def gem_available?(gemname)
  Gem::Specification.find_by_name(gemname) ? true : false
rescue LoadError
  return false
end

# check required gems
required_gems = %w(ipaddr addressable json)
required_gems.each do |thisgem|
  if gem_available?(thisgem)
    require thisgem
  else
    puts "WhatWeb is not installed and is missing dependencies.\nThe following gems are missing:"

    missing_gems = required_gems.map.select { |thisgem2| thisgem2 unless gem_available?(thisgem2) }
    missing_gems.sort.each {|thisgem2| puts " - #{thisgem2}" }

    puts "\nTo install run the following command from the WhatWeb folder:\n'bundle install'\n\n"
    exit 1
  end
end

optional_gems = %w(mongo rchardet pry rb-readline)
optional_gems.each do |thisgem|
  begin
    require thisgem if gem_available?(thisgem)
  rescue LoadError
    # that failed.. no big deal
    raise if $WWDEBUG == true
  end
end
