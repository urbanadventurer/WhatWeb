##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Added EXT HTTP header
##
Plugin.define "Allegro-RomPager" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.1"
description "The RomPager suite of products enable your engineering team to leverage proven Web-based technologies in your networked embedded device. - homepage: http://www.allegrosoft.com/embedded-web-server"

# ShodanHQ results as at 2010-10-26 #
# 2,247,816 for "server: RomPager"
# 190,212   for "server: Allegro-Software-RomPager" 
# 2,087,647 for "EXT: "



# Passive # HTTP Headers
def passive
	m=[]

	# Server # RomPager
	m << { :version=>@headers["server"].to_s.scan(/^[\s]*RomPager\/([^\s^\r^\n]+)/i).flatten } if @headers["server"].to_s =~ /^[\s]*RomPager\/([^\s^\r^\n]+)/i

	# Server # Allegro-Software-RomPager
	m << { :version=>@headers["server"].to_s.scan(/^[\s]*Allegro-Software-RomPager\/([^\s^\r^\n]+)/i).flatten } if @headers["server"].to_s =~ /^[\s]*Allegro-Software-RomPager\/([^\s^\r^\n]+)/i

	# EXT
	m << { :name=>"EXT HTTP Header" } if @headers["ext"] =~ //

	# Return passive matches
	m
end

end

