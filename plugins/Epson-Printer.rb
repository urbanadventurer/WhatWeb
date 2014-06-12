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



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^EPSON-HTTP\/([^\s]+)/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^EPSON-HTTP\/([^\s]+)/).flatten }

		# Module Detection # Title
		m << { :module=>@body.scan(/<TITLE>EpsonNet (WebAssist |Config )Rev\.([^<]+)<\/TITLE>/).flatten } if @body =~ /<TITLE>EpsonNet (WebAssist |Config )Rev\.([^<]+)<\/TITLE>/

	end

	# Return passive matches
	m
end

end

# An aggressive plugin could retrieve additional information from /Istatus.htm
# Including model, MAC address and version
# The contents of /Istatus.htm differs between models

