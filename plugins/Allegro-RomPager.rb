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
description "The RomPager suite of products enable your engineering team to leverage proven Web-based technologies in your networked embedded device. - homepage: http://www.allegrosoft.com/rpproduct.html"

# ShodanHQ results as at 2010-10-26 #
# 2,247,816 for "server: RomPager"
# 190,212   for "server: Allegro-Software-RomPager" 
# 2,087,647 for "EXT: "

# Examples #
examples %w|
74.189.97.193
68.68.104.145
203.1.55.183
152.2.189.5
67.103.40.123
63.202.242.22
118.222.183.51
99.151.224.78
24.42.153.177
96.61.248.100
71.2.238.96
92.81.141.159
69.232.80.182
183.80.68.157
110.139.190.183
110.139.164.11
99.59.65.251
125.166.145.144
123.27.50.94
125.161.205.182
|

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

