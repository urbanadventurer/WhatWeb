##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Railo" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Railo is an Open Source ColdFusion Markup Language (CFML) server."
website "http://getrailo.com/"

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

