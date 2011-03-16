##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SmugMug" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "SmugMug is a paid digital photo sharing website - Homepage: http://www.smugmug.com/"

# ShodanHQ results as at 2011-03-16 #
# 246 for x-powered-by smugmug

# Examples #
examples %w|
65.175.86.69
118.214.52.77
184.85.132.77
72.246.236.77
173.222.52.77
69.192.36.77
184.50.52.77
2.18.164.77
88.221.48.77
184.31.116.77
|

# Passive #
def passive
	m=[]

	# Version Detection # X-Powered-By
	m << { :version=>@meta["x-powered-by"].scan(/^SmugMug\/([\d\.]+)$/i) } if @meta["x-powered-by"] =~ /^SmugMug\/([\d\.]+)$/i

	# X-SmugMug-Values
	m << { :name=>"X-SmugMug-Values HTTP Header" } unless @meta["x-smugmug-values"].nil?

	# Return passive matches
	m
end

end


