##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "XBMC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-05
version "0.1"
description "XBMC (formerly 'Xbox Media Center') is a free, open source (GPL) multimedia player that runs on the first-generation Microsoft Xbox, (not the newer Xbox 360), as well as on computers running Linux, Mac OS X, and Windows."

# ShodanHQ results as at 2011-03-05 #
# 47 for XBMC -"xbmc.org"
# 46 for realm XBMC



# Matches #
matches [

# HTML Comment
{ :text=>'		<!-- <link rel="search" href="/provider.xml" type="application/opensearchdescription+xml" title="XBMC Library" /> -->', :string=>"Insecure" },

# favicon.ico
{ :url=>"/favicon.ico", :md5=>"46b742e6ba5d7ac03f13b312601c113f", :certainty=>75 },

]

# Passive #
def passive
	m=[]

	# realm=XBMC # realm="Keimo-XBMC" # realm="XBMC WebServer"
	m << { :name=>'HTTP WWW Authenticate header' } if @headers['www-authenticate'] =~ /realm=["]?XBMC/ or @headers['www-authenticate'] =~ /realm=["]?Keimo-XBMC/

	# Return passive matches
	m
end

end


