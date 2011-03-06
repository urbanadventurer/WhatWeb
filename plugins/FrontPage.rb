##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FrontPage" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.1"
description "FrontPage"

# About 1148067 ShodanHQ results for "server: Frontpage" @ 2010-10-26
examples %w|
205.234.252.238
69.162.186.70
129.121.38.159
198.104.177.102
74.81.84.111
74.53.136.101
74.53.225.110
198.104.62.165
174.122.231.220
66.49.171.154
|

# HTTP Header
def passive
	m=[]

	# Server
	m << { :version=>@meta["server"].to_s.scan(/[^\r^\n]*FrontPage\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*FrontPage\/([^\s^\r^\n]+)/i

	m

end

end

