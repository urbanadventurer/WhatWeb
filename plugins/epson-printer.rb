##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Epson-Printer"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-31
  "Andrew Horton", # v0.2 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Epson printer"
website "http://www.epson.com/"

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

matches [
	# Version Detection
	{ :version=>/^EPSON-HTTP\/([^\s]+)/, :search=>"headers[server]" },
	# Module Detection # Title
	{ :module=>/<TITLE>EpsonNet (WebAssist |Config )Rev\.([^<]+)<\/TITLE>/ },
]

end

# An aggressive plugin could retrieve additional information from /Istatus.htm
# Including model, MAC address and version
# The contents of /Istatus.htm differs between models

