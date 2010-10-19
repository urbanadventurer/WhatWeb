##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 
# Fixed regex to return multiple scripts
##
Plugin.define "Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.2"
description "This plugin detects instances of script HTML elements and grabs the URL."

# 384 results for "your browser does not support javascript" @ 2010-10-14
examples %w|
github.com
morningstarsecurity.com
twitter.com
wordpress.com
www.microsoft.com
|

# URL Extraction
def passive
	m=[]
		if @body =~ /<[\s]*script[^src]+src[\s]*=[\s]*[\"|\']*([^>^\"]+)/i
		version=@body.scan(/<[\s]*script[^src]+src[\s]*=[\s]*[\"|\']*([^>^\"]+)/i)
		m << { :version=>version }
	end

	m

end

end

