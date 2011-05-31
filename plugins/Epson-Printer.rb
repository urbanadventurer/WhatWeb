##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Epson-Printer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "Epson printer - Homepage: http://www.epson.com/"

# ShodanHQ results as at 2011-05-31 #
# 5,191 for EPSON-HTTP

# Google results as at 2011-05-31 #
# 37 for intitle:"EpsonNet (Config|WebAssist) Rev"
# 31 for intitle:"EpsonNet Config Rev"
# 13 for intitle:"EpsonNet WebAssist Rev"

# Dorks #
dorks [
'intitle:"EpsonNet (Config|WebAssist) Rev"'
]

# Examples #
examples %w|
150.214.136.211
150.69.34.68
210.240.13.55
157.181.227.182
133.11.188.97
133.95.98.60
130.75.17.112
163.22.242.122
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^EPSON-HTTP\/([^\s]+)/

		# Version Detection
		m << { :version=>@meta["server"].scan(/^EPSON-HTTP\/([^\s]+)/) }

		# Module Detection # Title
		m << { :module=>@body.scan(/<TITLE>EpsonNet (WebAssist |Config )Rev\.([^<]+)<\/TITLE>/).to_s } if @body =~ /<TITLE>EpsonNet (WebAssist |Config )Rev\.([^<]+)<\/TITLE>/

	end

	# Return passive matches
	m
end

end

# An aggressive plugin could retrieve additional information from /Istatus.htm
# Including model, MAC address and version
# The contents of /Istatus.htm differs between models

