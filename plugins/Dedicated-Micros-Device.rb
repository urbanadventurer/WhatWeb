##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dedicated-Micros-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-11
version "0.1"
description "Dedicated Micros is the world's leading manufacturer of CCTV solutions from megapixel IP cameras to high performance high definition recording, transmission and decoding systems. - Homepage: http://www.dedicatedmicros.com/"

# ShodanHQ results as at 2011-03-11 #
# 9,855 for ADH-Web

# Examples #
examples %w|
64.7.166.11
98.18.249.229
94.91.199.184
24.234.195.131
207.10.154.221
205.197.11.221
193.95.220.132
72.72.73.143
217.35.77.2
217.40.110.179
75.146.7.227
85.105.158.133
12.191.217.9
98.191.215.69
82.68.39.201
71.196.0.63
131.215.193.2
82.68.30.177
63.227.187.6
209.232.240.106
|

# Matches #
matches [

# Model Detection # SD / EcoSense # /webpages/live.shtml
{ :url=>"/gui/title.shtml", :model=>/^				var product = '([^']+)';[\s]*$/ },

# Model Detection # DS # /common/script_variables.js.shtml
{ :url=>"/common/script_variables.js.shtml", :model=>/^var SYSTEM_LOGO = "([^"]+)";[\s]*$/ },

# Model Detection # DVIP # /webpages/index.shtml
{ :url=>"/webpages/index.shtml", :text=>"	<title>DVIP</title>", :model=>"DVIP" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^ADH-Web$/

	# Return passive matches
	m
end

end


