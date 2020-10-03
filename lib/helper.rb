# Copyright 2009 to 2020 Andrew Horton and Brendan Coles
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
# Helper methods for output and conversion
#
module Helper

  # converts Hash, Array, or String to UTF-8
  def self.utf8_elements!(obj)
    if obj.class == Hash
      obj.each_value do |x|
        utf8_elements!(x)
      end
    elsif obj.class == Array
      obj.each do |x|
        utf8_elements!(x)
      end
    elsif obj.class == String
      convert_to_utf8(obj)
    end
  end

  # converts a string to UTF-8
  def self.convert_to_utf8(str)
    if defined?(String.new.scrub) # Defined in Ruby 2.1
      str.force_encoding("UTF-8").scrub
    else # Ruby 2.0
      str.encode('UTF-16', 'UTF-8', invalid: :replace, replace: '').encode('UTF-8')
    end
  rescue => e
    raise "Can't convert to UTF-8 #{e}"
  end


  #
  # Takes an integer of certainty (between 1 - 100)
  #
  # returns String a word representing the certainty
  #
  def self.certainty_to_words(certainty)
    case certainty
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
  def self.word_wrap(str, width = 10)
    ret = []
    line = ''

    str.to_s.split.each do |word|
      if line.size + word.size + 1 <= width
        line += "#{word} "
        next
      end

      ret << line

      if word.size <= width
        line = "#{word} "
        next
      end

      line = ''
      w = word.clone

      while w.size > width
        ret << w[0..(width - 1)]
        w = w[width.to_i..-1]
      end

      ret << w unless w.empty?
    end

    ret << line unless line.empty?
    ret
  end
end
