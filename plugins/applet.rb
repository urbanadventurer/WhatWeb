##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-07 #
# Updated URL extraction method
##
Plugin.define "Applet" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.2"
description "This plugin detects instances of applet HTML elements and retrieves the URL from the code parameter. - homepage: http://en.wikipedia.org/wiki/Java_applet"

# Google results as at 2010-10-15 #
# 183 for "this site requires java"

# Examples #
examples %w|
java.sun.com/applets/jdk/1.4/demo/applets/ArcTest/example1.html
java.sun.com/applets/jdk/1.4/demo/applets/BarChart/example1.html
java.sun.com/applets/jdk/1.4/demo/applets/TicTacToe/example1.html
java.sun.com/applets/jdk/1.4/demo/applets/Clock/example1.html
www.htmlcodetutorial.com/applets/applets.html
www.htmlcodetutorial.com/applets/_APPLET.html
www.whitehavenchargers.com
|

# Matches #
matches [

# Extract Code
{ :string=>/<applet[^>]+code[\s]*=[\s]*["|']?([^\s^>^"^']+)[^>]*>/i },

]

end

