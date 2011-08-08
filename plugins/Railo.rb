##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Railo" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Railo is an Open Source ColdFusion Markup Language (CFML) server. - Homepage: http://getrailo.com/"

# More Info #
# http://en.wikipedia.org/wiki/Railo

# ShodanHQ results as at 2011-07-27 #
# 523 for Railo-Version

# Google results as at 2011-07-27 #
# 128 for inurl:railo-context ext:cfm
#  20 for inurl:railo-context/admin/ ext:cfm
#  11 for +Password (intitle:"Railo Web Administrator"| intitle:"Railo Server Administrator") "All Rights Reserved"

# Dorks #
dorks [
'inurl:railo-context/admin/ ext:cfm'
]

# Examples #
examples %w|
www.getrailo.com
classic.railo.ch
reservations.clubhotel.com
publicity.payperinterviewpr.com
188.120.97.56:81
www.cannonpowercorp.com
www.vbscripts.com/railo-context/admin/server.cfm
69.63.147.101
71.203.84.30
184.168.78.113
88.80.214.193
94.127.2.67
205.210.189.65
46.163.69.220
203.99.147.201
69.67.30.36
|

# Matches #
matches [

# JavaScript
{ :text=>'<script language = "JavaScript" type="text/javascript" src="/railo-context/form.cfm"></script><script language = "JavaScript" type="text/javascript">' },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Railo-Version Header
	m << { :version=>@headers["railo-version"].to_s } if @headers["railo-version"] =~ /^[\d\.]+$/

	# Return passive matches
	m
end
end

