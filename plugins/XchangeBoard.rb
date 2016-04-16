##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-19 #
# Updated version detection
##
Plugin.define "XchangeBoard" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-21
version "0.2"
description "Old forum"
website "http://www.xchangeboard.de"

# Google results as at 2010-08-21 #
# 30 for "powered by XchangeBoard"



# Matches #
matches [

# Default CSS
{ :text=>'h1,h2,h3,h4,p,ul,ol,li,div,td,th,address,blockquote,nobr,b,i {' },

# Version Detection # Powered by footer text
{ :version=>/	<div align="center"><small>Powered by <a href="http:\/\/www.xchangeboard.de">XchangeBoard<\/a> ver ([\d\.a-z]+) - / },

]

end


