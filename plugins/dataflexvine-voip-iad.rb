##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "DataflexViNE-VoIP-IAD"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-04-11
  "Andrew Horton", # v0.2 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "The ViNE range of VoIP ADSL and VoIP SHDSL IADs support both SIP and MGCP protocols depending on the infrastructure and application for VoIP. Remote updates are possible to switch between either VoIP protocols and VoDSL."
website "http://www.dataflex.com/"

# ShodanHQ results as at 2011-04-11 #
# 2,609 for DataflexViNE-Webserver

matches [
	# Version Detection # HTTP Server Header
	{ :search=>"headers[server]", :version=>/DataflexViNE-Webserver\/([\d\.]+)/ }

]

end

