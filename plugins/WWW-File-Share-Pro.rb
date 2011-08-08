##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WWW-File-Share-Pro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-20
version "0.1"
description "WWW File Share Pro - Share all kinds of files on the internet or on your intranet with this handy software. - Homepage: http://www.wfshome.com/"

# ShodanHQ results as at 2011-04-20 #
# 203 for WWW File Share Pro

# Google results as at 2011-04-20 #
# 41 for "Powered by LionMax Software" intitle:"WWW File Share" -allintext

# Dorks #
dorks [
'"Powered by LionMax Software" intitle:"WWW File Share" -allintext'
]

# Examples #
examples %w|
www.dferg.org:8085
69.31.150.217
hs1fqe.no-ip.info:1000
ams.nasgur.ru
stevenamy.homeip.net:8225
stevensoto.dyndns.tv:8225
24.5.163.251
83.132.147.229
77.126.163.55
202.130.119.66
122.117.166.98
190.187.43.22
|

# Matches #
matches [

# Powered by link
{ :text=>'<td height="27"><a href="http://www.lionmax.com" target="_blank">Powered by LionMax Software</a></td>' },

]

# Passive #
def passive
	m=[]

	# HTTP Server header
	m << { :name=>"HTTP Server header" } if @headers["server"] =~ /^WWW File Share Pro$/

	# Return passive matches
	m
end

end


