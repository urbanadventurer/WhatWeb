##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dedicated-Micros-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-11
version "0.1"
description "Dedicated Micros is the world's leading manufacturer of CCTV solutions from megapixel IP cameras to high performance high definition recording, transmission and decoding systems."
website "http://www.dedicatedmicros.com/"

# ShodanHQ results as at 2011-03-11 #
# 9,855 for ADH-Web



# Matches #
matches [

# Model Detection # SD / EcoSense # /webpages/live.shtml
{ :url=>"/gui/title.shtml", :model=>/^				var product = '([^']+)';[\s]*$/ },

# Model Detection # DS # /common/script_variables.js.shtml
{ :url=>"/common/script_variables.js.shtml", :model=>/^var SYSTEM_LOGO = "([^"]+)";[\s]*$/ },

# Model Detection # DVIP # /webpages/index.shtml
{ :url=>"/webpages/index.shtml", :text=>"	<title>DVIP</title>", :model=>"DVIP" },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^ADH-Web$/ },

]

end


