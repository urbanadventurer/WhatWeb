##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Python" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.1"
description "Python is a programming language that lets you work more quickly and integrate your systems more effectively. You can learn to use Python and see almost immediate gains in productivity and lower maintenance costs. - homepage: http://www.python.org/"

# About 170076 ShodanHQ results for "server: python" @ 2010-10-26
examples %w|
72.232.179.28
85.196.81.28
68.142.82.239
63.249.122.25
203.183.137.19
88.59.59.122
202.218.45.38
64.46.38.65
87.230.21.122
77.37.14.114
|

# HTTP Header
def passive
	m=[]

	# Server # Version Detection
	m << { :version=>@meta["server"].to_s.scan(/[^\r^\n]* Python\/([^\s^\r^\n]+)/).to_s } if @meta["server"].to_s =~ /[^\r^\n]* Python\/([^\s^\r^\n]+)/

	m

end

end

