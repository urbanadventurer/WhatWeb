##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Videoconference-Management-System" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "TANDBERG video conferencing management system web interface - http://www.tandberg.com/"

# 8 results for intitle:"Middle frame of Videoconference Management System" ext:htm
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1347
# 2 results for intitle:"TANDBERG" "This page requires a frame capable browser!"
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1346


matches [

{ :text=>'<meta NAME="AUTHOR" CONTENT="TANDBERG ASA (http://www.tandberg.net)">' },

{ :text=>'content="TANDBERG is a leading global provider of videoconferencing solutions. The company designs, develops and manufactures videoconferencing systems and offers sales, support and value-added services in more than 50 countries worldwide.">' },

{ :text=>'<title>TANDBERG</title>' },

{ :text=>'		<frame src="framemiddle.htm" name="No Name" noresize marginheight="0">' },

{ :text=>'	<title>Middle frame of Videoconference Management System</title>' },

]


end

