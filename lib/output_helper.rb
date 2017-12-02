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

#
# Output helper methods
#
module OutputHelper 
  #
  # Takes an integer of certainty (between 1 - 100)
  #
  # returns String a word representing the certainty
  #
  def certainty_to_words(p)
    case p
    when 0..49
      'maybe'
    when 50..99
      'probably'
    when 100
      'certain'
    end
  end

  #
  # Word wraps a string. Used by plugin_info and OutputVerbose.
  #
  # returns Array an array of lines.
  #
  def word_wrap(s, width = 10)
    ret = []
    line = ''
    s.split.map do |x|
      word = x
      if line.size + x.size + 1 <= width
        line += x + ' '
      else
        if word.size > width
          ret << line
          line = ''
          w = word.clone
          while w.size > width
            ret << w[0..(width - 1)]
            w = w[width.to_i..-1]
          end
          ret << w unless w.empty?
        else
          ret << line
          line = x + ' '
        end
      end
    end
    ret << line unless line.empty?
    ret
  end
end
