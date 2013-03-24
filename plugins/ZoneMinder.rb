##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ZoneMinder" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-01
version "0.1"
description "Linux video camera security and surveillance solution - Web interface - Requires MySQL and PHP - Homepage: http://www.zoneminder.com/"

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

# Examples #
examples %w|
24.35.239.147
195.210.60.124
81.29.182.175
201.238.229.105
201.148.36.170
91.143.208.137
99.44.169.136
187.206.138.62
77.108.31.133
https://zoneminder.dsr.life.ku.dk/zm/
www.ttgoz.com/zm/index.php
entr.co.uk/zoneminder/
pix.chill.colostate.edu
stresslessgroup.com/index.php
67.212.42.104/index.php
guardduty.corrilan.com
darkcity.ca/index.php
cams.padgettlawoffice.net:83/zm/
video.evairtight.com
cams.lewispestcontrol.net:81/zm/
chittavritti.com/zm/
stupidrob.net/zm/index.php
hrib.net/zm/
loveyourwife.com/zm/
crespo.us:8888/zm/
96.37.141.218:88/zm/index.php
www.jcshome.net/zm/index.php
cameras.arenafernandasselin.com
www.robertdwatson.com
camera.mrroofing.com
6810.redkingfoods.com:8888/zm/
|

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

