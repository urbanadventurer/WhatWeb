##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Tenon-iTools" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.2"
description "iTools 9 is a web site management system for both small to medium-sized web hosting providers that own or rent dedicated servers, and for large service providers who may wish to bundle iTools into their offerings. iTools is ideal for the professional hosting of multiple companies on a single server; it shortens the time and lessens the expertise needed to deploy new sites. iTools's secure, domain-specific, browser-based Apache administration, using a 9th generation suite of tools, makes Apache on Mac OS X, the easiest Apache in the world to administer."
website "http://www.tenon.com/products/itools-osx/"

# 687 ShodanHQ results for iTools @ 2010-11-01

matches [
	
	# HTTP Server Header
	{ :regexp=>/\(iTools/, :search=>"headers[server]" },

	# HTTP Server Header # Version Detection
	{ :version=>/\(iTools ([\d\.]+)[\)]?\/Mac OS X\)/, :string=>"Mac OS X", :search=>"headers[server]" },

]

end

