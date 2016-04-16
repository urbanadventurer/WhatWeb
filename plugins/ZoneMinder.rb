##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ZoneMinder" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-01
version "0.1"
description "Linux video camera security and surveillance solution - Web interface - Requires MySQL and PHP"
website "http://www.zoneminder.com/"

# ShodanHQ results as at 2013-01-22 #
# 1,020 for ZMSESSID

# Google results as at 2011-08-01 #
# 371 for "ZoneMinder Login" +Username +Password
#  18 for "ZoneMinder Console - Running" intitle:Console inurl:view=console

# Dorks #
dorks [
'"ZoneMinder Console - Running" intitle:Console inurl:view=console',
'"ZoneMinder Login" "Username" "Password" intitle:Login'
]



# Matches #
matches [

# favicon # /graphics/favicon.ico
{ :md5=>"e07c0775523271d629035dc8921dffc7", :url=>"/graphics/favicon.ico" },

# ZoneMinder Login Heading
{ :text=>'<tr><td colspan="2" class="smallhead" align="center">ZoneMinder Login</td></tr>' },

# Detect number of monitors
{ :string=>/<div id="monitorSummary"><a href="\?view=groups" onclick="createPopup\( '\?view=groups', 'zmGroups', 'groups' \); return\( false \);">([\d]+ Monitors)<\/a><\/div>/ },
{ :string=>/<a href="javascript: newWindow\( '\/index\.php\?view=groups', 'zmGroups', 400, 220 \);">([\d]+ Monitors)<\/a>/ },

# Version Detection
{ :version=>/Running<\/a> - <a href="\?view=version" onclick="createPopup\( '\?view=version', 'zmVersion', 'version' \); return\( false \);">v([^<^\s]+)<\/a><\/h2>/ },
{ :version=>/Running<\/a> - <a href="javascript: newWindow\( '\/index\.php\?view=version', 'zmVersion', 320, 140 \);">v([^<^\s]+)<\/a>/ },
{ :search=>"headers[server]", :version=>/^ZoneMinder Video Server\/([^\s]+)$/ },

# ZMSESSID Cookie
{ :search=>"headers[set-cookie]", :regexp=>/ZMSESSID=[^;]+/ },

]

# Passive #
def passive
	m=[]

	# Combined Match # h1 Heading and Password field
	if @body =~ /<h1>ZoneMinder Login<\/h1>/ and @body =~ /<td class="colRight"><input type="password" name="password" value="" size="12"\/><\/td>/

		m << { :name=>"h1 Heading and Password field" }

	end

	# Return passive matches
	m
end
end

