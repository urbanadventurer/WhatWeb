##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-19 # Andrew Horton
# Replaced passive function with match
##
# Version 0.2 #
# Added EXT HTTP header
##
Plugin.define "Allegro-RomPager" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.3"
description "The RomPager suite of products enable your engineering team to leverage proven Web-based technologies in your networked embedded device."
website "http://www.allegrosoft.com/embedded-web-server"

# ShodanHQ results as at 2010-10-26 #
# 2,247,816 for "server: RomPager"
# 190,212   for "server: Allegro-Software-RomPager" 
# 2,087,647 for "EXT: "

matches [
	# Server # RomPager
	{ :version=>/^[\s]*RomPager\/([^\s^\r^\n]+)/, :search=>"headers[server]" },

	# Server # Allegro-Software-RomPager
	{ :version=>/^[\s]*Allegro-Software-RomPager\/([^\s^\r^\n]+)/, :search=>"headers[server]" },
	
	# EXT
	{ :text=>"", :search=>"headers[ext]" },

]

end

