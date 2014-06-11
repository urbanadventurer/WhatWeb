##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Bobo" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-02
version "0.1"
description "Bobo is a light-weight framework for creating WSGI web applications. It's goal is to be easy to use and remember. It addresses 2 problems: 1) mapping URLs to objects and 2) calling objects to generate HTTP responses. Bobo doesn't have a templating language, a database integration layer, or a number of other features that are better provided by WSGI middle-ware or application-specific libraries. Bobo builds on other frameworks, most notably WSGI and WebOb. - homepage: http://bobo.digicool.com/"

# ShodanHQ results as at 2010-11-02 #
# 95  for X-Ksscommands:
# 441 for Bobo-Exception-Line
# 441 for Bobo-Exception-Value
# 441 for Bobo-Exception-Type



# Passive #
def passive
	m=[]

	# Bobo-Exception-Line
	m << { :name=>"HTTP Bobo-Exception-Line Header" } unless @headers["bobo-exception-line"].nil?

	# Bobo-Exception-Value
	m << { :name=>"HTTP Bobo-Exception-Value Header" } unless @headers["bobo-exception-value"].nil?

	# Extract # Bobo-Exception-File
	m << { :string=>@headers["bobo-exception-file"].scan(/([^\r^\n]+)/).flatten } if @headers["bobo-exception-file"] =~ /([^\r^\n]+)/

	# Extract # Bobo-Exception-Type
	m << { :string=>@headers["bobo-exception-type"].scan(/([^\r^\n]+)/).flatten } if @headers["bobo-exception-type"] =~ /([^\r^\n]+)/

	# X-Ksscommands
	m << { :name=>"X-Ksscommands HTTP Header" } unless @headers["x-ksscommands"].nil?

	m

end

end

