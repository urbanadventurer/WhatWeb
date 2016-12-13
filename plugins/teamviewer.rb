##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TeamViewer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-17
version "0.1"
description "TeamViewer - the All-In-One Solution for Remote Access and Support over the Internet"
website "http://www.TeamViewer.com"



# Matches #
matches [

# Home Page
{ :text=>"<html><body>This site is running <a href='http://www.TeamViewer.com'>TeamViewer</a>.</body></html>" },

]

end

