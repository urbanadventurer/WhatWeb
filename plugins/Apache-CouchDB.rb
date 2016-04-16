##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Apache-CouchDB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-03
version "0.1"
description "Apache CouchDB is a document-oriented database written in Erlang that can be queried and indexed in a MapReduce fashion using JavaScript. CouchDB provides a RESTful JSON API than can be accessed from any environment that allows HTTP requests."
website "http://couchdb.apache.org/"

# More Info #
# http://en.wikipedia.org/wiki/CouchDB
# http://www.erlang.org/doc/

# ShodanHQ results as at 2011-08-03 #
# 41 for CouchDB



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^CouchDB\/([^\s]+) \((Erlang OTP\/R[^\s^\)]+)\)$/
		m << { :version=>"#{$1}" }
		m << { :string=>"#{$2}" }
	end

	# Return passive matches
	m
end
end

