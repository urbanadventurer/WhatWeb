##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BadBlue" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-20
version "0.1"
description "A free, very small Windows web server for sharing, publishing and serving files. - Homepage: http://www.badblue.com/"

# Google results as at 2011-04-20 #
# 12 for intitle:"BadBlue: the file-sharing web server anyone can use" -intitle

# ShodanHQ results as at 2011-04-20 #
# 18 for BadBlue

# Dorks #
dorks [
'intitle:"BadBlue: the file-sharing web server anyone can use" -intitle'
]

# Examples #
examples %w|
milesg.dyndns.tv/ext.dll
89.184.116.10/ext.dll
dusanpregelj.homeip.net:8888
174.74.8.72:5631/ext.dll
fileshare.augustmack.com/ext.dll
inshadow.servebbs.com/ext.dll
news.missvalley.com/ext.dll
dilatedpeoples.no-ip.com:5555/ext.dll
scorchedsilicon.com:8080/ext.dll
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^BadBlue\/([\d\.]+)$/) } if @headers["server"] =~ /^BadBlue\/([\d\.]+)$/

	# Return passive matches
	m
end

end


