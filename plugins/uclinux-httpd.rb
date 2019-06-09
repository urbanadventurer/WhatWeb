##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "uClinux-httpd"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-04-08
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "The Linux/Microcontroller project (uClinux) is a port of Linux to systems without a Memory Management Unit (MMU). This plugin identifies the version of the uClinux HTTP server"
website "http://www.uclinux.org/"

# ShodanHQ results as at 2011-04-08 #
# 6,633 for uClinux-httpd

matches [

	# HTTP Server Header
	{ :os=>"uClinux", :version=>/^uClinux/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :os=>"uClinux", :version=>/^uClinux-httpd ([\d\.]+)$/, :search=>"headers[server]" },

]

end

