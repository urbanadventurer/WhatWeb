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

def colorize(text, color_code)
  "#{color_code}#{text}\e[0m"
end

def red(text)
  colorize(text, "\e[1m\e[31m")
end

def dark_red(text)
  colorize(text, "\e[31m")
end

def green(text)
  colorize(text, "\e[1m\e[32m")
end

def dark_green(text)
  colorize(text, "\e[32m")
end

def yellow(text)
  colorize(text, "\e[1m\e[33m")
end

def dark_yellow(text)
  colorize(text, "\e[33m")
end

def blue(text)
  colorize(text, "\e[1m\e[34m")
end

def dark_blue(text)
  colorize(text, "\e[34m")
end

def magenta(text)
  colorize(text, "\e[1m\e[35m")
end

def dark_magenta(text)
  colorize(text, "\e[35m")
end

def cyan(text)
  colorize(text, "\e[1m\e[36m")
end

def dark_cyan(text)
  colorize(text, "\e[36m")
end

def white(text)
  # quick patch for issue #345 so it's readable with a white terminal background
  # not white, but bold
  colorize(text, "\e[1m")
end

def grey(text)
  # not grey, but reset
  colorize(text, "\e[0m\e[22m")
end
