##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WANem" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-08
version "0.1"
description "WANem is a Wide Area Network emulator designed by Performance Engineering Research Centre, TATA Consultancy Services, Mumbai."
website "http://wanem.sourceforge.net/"



# Matches #
matches [

# / # Version Detection # Body Heading
{ :version=>/<html><body><h1>WANem v([^\s^:]+): It works\!<\/h1><\/body><\/html>/ },

# /WANem/about.html # Version Detection
{ :url=>'/WANem/about.html', :version=>/<b>WANem v([^\s^<]+)<\/b><br>/ },

# /WANem/title.html # Title
{ :url=>'/WANem/title.html', :text=>'<TITLE>Welcome to WANem</TITLE>' },

]

end

