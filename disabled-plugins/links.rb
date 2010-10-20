##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Links" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-20
version "0.1"
description "This plugin attempts to extract all the links from the HTML source."

examples %w|
itsecuritysolutions.org
morningstarsecurity.com
yehg.net
|

# Extract links
def passive
	m=[]

	# href
	if @body =~ /<[^>]+href[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]*>/i
		modules=@body.scan(/<[^>]+href[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]*>/i).uniq
		m << { :modules=>modules }
	end

	# src
	if @body =~ /<[^>]+src[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]*>/i
		modules=@body.scan(/<[^>]+src[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]*>/i).uniq
		m << { :modules=>modules }
	end

	m

end

end

