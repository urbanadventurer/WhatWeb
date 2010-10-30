##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SVN" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.1"
description "SVN HTTP header."

# About 85500 ShodanHQ results for "server: SVN" @ 2010-10-30
examples %w|
66.240.245.95
77.72.193.242
222.35.105.19
77.109.205.134
85.25.68.136
94.138.75.226
123.100.120.5
88.86.105.120
209.169.4.170
69.9.183.118
|

# HTTP Header
def passive
	m=[]

	m << { :version=>@meta["server"].scan(/[^\r^\n]*SVN\/([^\r^\n^\s]*)/) } if @meta["server"] =~ /[^\r^\n]*SVN\/([^\r^\n^\s]*)/

	m

end

end

