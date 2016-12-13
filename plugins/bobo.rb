##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##

Plugin.define "Bobo" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-02
version "0.2"
description "Bobo is a light-weight framework for creating WSGI web applications. It's goal is to be easy to use and remember. It addresses 2 problems: 1) mapping URLs to objects and 2) calling objects to generate HTTP responses. Bobo doesn't have a templating language, a database integration layer, or a number of other features that are better provided by WSGI middle-ware or application-specific libraries. Bobo builds on other frameworks, most notably WSGI and WebOb."
website "http://bobo.digicool.com/"

# ShodanHQ results as at 2010-11-02 #
# 95  for X-Ksscommands:
# 441 for Bobo-Exception-Line
# 441 for Bobo-Exception-Value
# 441 for Bobo-Exception-Type

matches [

	# Bobo-Exception-Line
	{  :name=>"HTTP Bobo-Exception-Line Header", :regexp=>//, :search=>"headers[bobo-exception-line]" },

	# Bobo-Exception-Value
	{  :name=>"HTTP Bobo-Exception-Value Header", :regexp=>//, :search=>"headers[bobo-exception-value]" },

	# Extract # Bobo-Exception-File
	{  :name=>"HTTP Bobo-Exception-File Header", :string=>/([^\r^\n]+)/, :search=>"headers[bobo-exception-file]" },

	# Extract # Bobo-Exception-File
	{  :name=>"HTTP Bobo-Exception-Type Header", :string=>/([^\r^\n]+)/, :search=>"headers[bobo-exception-type]" },

	# X-Ksscommands
	{  :name=>"X-Ksscommands HTTP Header", :regexp=>//, :search=>"headers[x-ksscommands]" },

]

end

