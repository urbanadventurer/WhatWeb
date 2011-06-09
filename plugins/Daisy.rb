##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Daisy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-09
version "0.1"
description "Daisy is a content management system that offers rich out-of-the-box functionality combined with solid foundations for extensibility and integration. Daisy consists of two main components: a stand-alone repository server accessible through HTTP/XML (using the ReST style of WebServices) and/or a high-level (remote) Java API, and an extensive editing and publishing front-end web application running inside Apache Cocoon. - Homepage: http://daisycms.org/daisy/about.html"

# Documentation: http://cocoondev.org/books/daisy_docs_book--20070924-074927/publications/html-one-page/output/index.html

# ShodanHQ results as at 2011-06-09 #
# 26 for X-Daisy-Version

# Examples #
examples %w|
91.121.61.160
64.54.134.54
88.151.243.70
128.40.182.18
64.54.132.11
64.54.132.14
208.75.86.26
64.54.132.119
|

# Passive #
def passive
	m=[]

	# HTTP X-Daisy-Version Header
	unless @meta["x-daisy-version"].nil?

		# Version Detection
		m << { :version=>@meta["x-daisy-version"].scan(/^([^\s]+) \(build: [^\s]+/).to_s } if @meta["x-daisy-version"] =~ /^([^\s]+) \(build:( [^\s]+)/

		# Build Detection
		m << { :string=>@meta["x-daisy-version"].scan(/^[^\s]+ \(build: ([^\s]+)/).to_s } if @meta["x-daisy-version"] =~ /^[^\s]+ \(build: ([^\s]+)/

	end

	# Return passive matches
	m
end

end

