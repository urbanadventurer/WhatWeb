##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Python" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.1"
description "Python is a programming language that lets you work more quickly and integrate your systems more effectively. You can learn to use Python and see almost immediate gains in productivity and lower maintenance costs."
website "http://www.python.org/"

# About 170076 ShodanHQ results for "server: python" @ 2010-10-26


# HTTP Header
def passive
	m=[]

	# Server # Version Detection
	m << { :version=>@headers["server"].to_s.scan(/[^\r^\n]* Python\/([^\s^\r^\n]+)/).flatten } if @headers["server"].to_s =~ /[^\r^\n]* Python\/([^\s^\r^\n]+)/

	m

end

end

