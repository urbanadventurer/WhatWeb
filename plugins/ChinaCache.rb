##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ChinaCache" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.1"
description "ChinaCache is a leading content distribution network (CDN) service provider in China. This header, vehicolated through squid, not only tells the world where the content is coming from, it also brings some (obscure) info with it. What is sure is that there is no open standard on how to use this server header field. Probably it is there only for debugging purposes by the employees of ChinaCache. - homepage: http://www.chinacache.com/"

# About 958 ShodanHQ results for "Powered-By-ChinaCache" @ 2010-10-30
examples %w|
220.181.64.242
58.68.168.210
221.192.148.123
221.206.124.155
222.138.229.250
218.29.42.138
60.169.10.65
110.93.136.252
221.192.149.214
121.14.235.222
|

# HTTP Header
def passive
	m=[]

	m << { :string=>@meta["powered-by-chinacache"].scan(/[\s]*([^\r^\n]*)/) } if @meta["powered-by-chinacache"] =~ /[\s]*([^\r^\n]*)/

	m

end

end

