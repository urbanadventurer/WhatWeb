##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zope" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-02
version "0.1"
description "Zope is an open source web application server primarily written in the Python programming language. It features a transactional object database which can store not only content and custom data, but also dynamic HTML templates, scripts, a search engine, and relational database (RDBMS) connections and code. - homepage: http://www.zope.org/"

# About 6219 ShodanHQ results for Server: Zope
examples %w|
146.193.41.154
80.121.217.35
146.193.41.215
64.22.192.206
194.24.235.187
146.193.41.46
202.154.203.34
88.34.185.176
198.209.153.16
82.100.204.40
|

# Passive #
def passive
	m=[]

	# Version # HTTP Server Header
	m << { :version=>@meta["server"].scan(/Zope\/\(([^,]*)/) } if @meta["server"] =~ /Zope\/\(([^,]*)/

	# Python # HTTP Server Header
	m << { :module=>@meta["server"].scan(/Zope\/\([^,]*, ([^,]*)/) } if @meta["server"] =~ /Zope\/\([^,]*, ([^,]*)/

	# OS # HTTP Server Header
	m << { :string=>@meta["server"].scan(/Zope\/\([^,]*, [^,]*, ([^\)^\s]*)/) } if @meta["server"] =~ /Zope\/\([^,]*, [^,]*, ([^\)^\s]*)/

	m

end

end

