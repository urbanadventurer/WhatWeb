##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "x-pingback" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-28
version "0.1"
description "A pingback is one of three types of linkbacks, methods for Web authors to request notification when somebody links to one of their documents. This enables authors to keep track of who is linking to, or referring to their articles. Some weblog software, such as Movable Type, Serendipity, WordPress and Telligent Community, support automatic pingbacks where all the links in a published article can be pinged when the article is published. - More info: http://en.wikipedia.org/wiki/Pingback"

# About 111664 ShodanHQ results for x-pingback @ 2010-10-28
examples %w|
www.wordpress.com
195.158.41.1
82.103.135.222
173.224.115.166
67.215.246.126
96.0.164.173
76.162.52.111
64.34.110.21
65.164.217.86
98.130.232.45
109.75.97.150
163.121.52.134
24.173.89.252
168.177.21.37
202.184.111.36
207.41.16.115
69.63.153.173
193.105.109.38
63.118.57.57
142.31.97.190
202.144.154.34
184.82.44.96
|

# Passive #
def passive
	m=[]
	
	# X-Pingback HTTP Header
	m << { :string=>@meta["x-pingback"].scan(/[\s]*([^\r^\n]*)/i) } if @meta["x-pingback"] =~ /[\s]*([^\r^\n]*)/i

	m

end

end

