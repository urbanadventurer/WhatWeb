##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TiVo" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-21
version "0.1"
description "TiVo is a digital video recorder developed and marketed by TiVo, Inc. - Homepage: http://www.tivo.com/"

# Google results as at 2011-05-21 #
# 1 for intitle:"TiVo DVR" "Congratulations" "You've successfully connected your TiVo"

# ShodanHQ results as at 2011-05-21 #
# 4,997 for tivo-httpd

# Dorks #
dorks [
'intitle:"TiVo DVR" "Congratulations" "You\'ve successfully connected your TiVo"'
]

# Examples #
examples %w|
66.57.118.176
208.96.183.183
97.87.141.250
76.78.179.18
71.116.244.4
24.161.58.124
129.59.56.111
128.164.248.254
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^tivo-httpd-[\d]+:(.+)$/) } if @meta["server"] =~ /^tivo-httpd-[\d]+:(.+)$/

	# Return passive matches
	m
end

end

