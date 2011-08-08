##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kohana" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-10
version "0.1"
description "Kohana is an elegant HMVC PHP5 framework that provides a rich set of components for building web applications. - Homepage: http://kohanaframework.org/"

# Google results as at 2011-05-10 #
# 394 for kohanasession

# Examples #
examples %w|
173.236.253.200
95.211.134.23
97.74.156.171
209.197.102.247
208.38.165.89
66.161.179.75
75.101.147.60
91.211.221.16
74.206.229.139
38.103.33.205
|

# Matches #
matches [


]

# Passive #
def passive
	m=[]

	# kohanasession cookie
	m << { :name=>"kohanasession cookie" } if @headers["set-cookie"] =~ /kohanasession=[a-z\d]{26}; expires=/

	# kohanasession_data cookie
	m << { :name=>"kohanasession_data cookie" } if @headers["set-cookie"] =~ /kohanasession_data=/

	# Return passive matches
	m
end

end


