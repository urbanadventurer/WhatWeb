##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "HeiTel-Digital-Video-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "HeiTel Digital Video Device - Platform-independent live image transmission and camera remote control via PC, Smartphone and PDA browser "
website "http://www.heitel.com/en/products/software/web-server/index.html"
# Data Sheet: http://www.heitel.com/upload/downloads/en/04-data-sheets/english/pr_ws_gb.pdf

# ShodanHQ results as at 2011-03-14 #
# 1,750 for HeiTel GmbH Web Server

matches [
	
	{ :regexp=>/^HeiTel GmbH Web Server/, :search=>"headers[server]" },
	# Version Detection # HTTP Server Header
	{ :version=>/^HeiTel GmbH Web Server \[V([\d\.]+)\/V([\d\.]+)\/V([\d\.]+)\]$/, :search=>"headers[server]" },
	
]

end

