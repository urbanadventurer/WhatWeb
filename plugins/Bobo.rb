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

# 95 ShodanHQ results for X-Ksscommands:
# 441 ShodanHQ results for Bobo-Exception-Line
# 441 ShodanHQ results for Bobo-Exception-Value
# 441 ShodanHQ results for Bobo-Exception-Type
examples %w|
78.47.94.29
83.175.124.83
88.191.65.203
82.100.204.40
210.188.216.218
147.120.13.109
82.165.128.216
129.59.129.64
63.82.98.55
188.120.70.202
129.219.28.106
212.48.35.37
|

# Passive #
def passive
	m=[]

	# Bobo-Exception-Line
	m << { :name=>"HTTP Bobo-Exception-Line Header" } unless @meta["bobo-exception-line"].nil?

	# Bobo-Exception-Value
	m << { :name=>"HTTP Bobo-Exception-Value Header" } unless @meta["bobo-exception-value"].nil?

	# Extract # Bobo-Exception-File
	m << { :string=>@meta["bobo-exception-file"].scan(/([^\r^\n]+)/).to_s } if @meta["bobo-exception-file"] =~ /([^\r^\n]+)/

	# Extract # Bobo-Exception-Type
	m << { :string=>@meta["bobo-exception-type"].scan(/([^\r^\n]+)/).to_s } if @meta["bobo-exception-type"] =~ /([^\r^\n]+)/

	# X-Ksscommands
	m << { :name=>"X-Ksscommands HTTP Header" } unless @meta["x-ksscommands"].nil?

	m

end

end

