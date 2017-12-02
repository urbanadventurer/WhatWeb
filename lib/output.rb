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

class Output
  # if no f, output to STDOUT,
  # if f is a filename then open it, if f is a file use it
  def initialize(f = STDOUT)
    f = STDOUT if f == '-'
    @f = f if f.class == IO || f.class == File
    @f = File.open(f, 'a') if f.class == String
    @f.sync = true # we want flushed output
  end

  def close
    @f.close unless @f.class == IO
  end

  # perform sort, uniq and join on each plugin result
  def suj(plugin_results)
    suj = {}
    [:certainty, :version, :os, :string, :account, :model, :firmware, :module, :filepath].map do |thissymbol|
      t = plugin_results.map { |x| x[thissymbol] unless x[thissymbol].class == Regexp }.flatten.compact.sort.uniq.join(',')
      suj[thissymbol] = t
    end
    suj[:certainty] = plugin_results.map { |x| x[:certainty] }.flatten.compact.sort.last.to_i # this is different, it's a number
    suj
  end

  # sort and uniq but no join. just for one plugin result
  def sortuniq(p)
    su = {}
    [:name, :certainty, :version, :os, :string, :account, :model, :firmware, :module, :filepath].map do |thissymbol|
      next if p[thissymbol].class == Regexp
      t = p[thissymbol]
      t = t.flatten.compact.sort.uniq if t.is_a?(Array)
      su[thissymbol] = t unless t.nil?
    end
    # certainty is different, it's a number
    su[:certainty] = p[:certainty].to_i
    su
  end
end

class OutputErrors < Output
  # don't need semaphore.synchronize, as it's locked by the error handling routine
  def out(error)
    @f.puts error
  end
end

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

# load the lib/output/ folder
$LOAD_PATH.map do |folder|
  next unless File.exist?(folder + '/lib/output/')
  Dir.glob("#{folder}/lib/output/*.rb").each do |x|
    load x
  end
end
