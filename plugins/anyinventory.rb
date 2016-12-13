##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated version detection
##
Plugin.define "anyInventory" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-25
version "0.2"
description "anyInventory, the most flexible and powerful web-based inventory system"
website "http://anyinventory.sourceforge.net/"

# 51 results for "anyInventory, the most flexible and powerful web-based inventory system" @ 2010-07-25


matches [

# Default title
{ :text=>'		<title>anyInventory: Top</title>' },

# Default HTML
{ :regexp=>/					 you have inventoried <b>[0-9]*<\/b>  items with <a href="http:\/\/anyinventory.sourceforge.net\/">anyInventory, the most flexible and powerful web-based inventory system<\/a>/ },

# Version detection # default whitespace and version
# Tested versions: 1.9.1 / 1.9.2 / 2.0
{ :version=>/								anyInventory ([\d\.]+)/ },

]

end

