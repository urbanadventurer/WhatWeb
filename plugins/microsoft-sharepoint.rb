##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-24 #
# Added HTTP Header match
##
Plugin.define "Microsoft-Sharepoint" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-05 
version "0.2"
description "Microsoft SharePoint 2010 makes it easier for people to work together. Using SharePoint 2010, your people can set up Web sites to share information with others, manage documents from start to finish, and publish reports to help everyone make better decisions. - homepage: http://sharepoint.microsoft.com/"

# About 39,000 Google results for +"Please enable scripts and reload this page. If your browser does not support script, then you can visit the minimal version of this site at" @ 2010-06-05
# About 35,110 ShodanHQ for MicrosoftSharePointTeamServices @ 2011-01-24

# Examples #
examples %w|
94.55.60.5
200.27.67.207
122.49.77.200
112.169.172.67
216.10.246.74
216.185.69.125
75.150.39.150
200.94.102.11
142.229.228.90
66.213.178.36
sharepoint.microsoft.com
www.wssdemo.com
www.sharepointmadscientist.com
blog.tedpattison.net
www.heatherwaterman.com
www.cospug.com
www.sharepointgrind.com
www.nwcsupport.com
www.diegotrashcan.com
www.spfoxhole.com
www.sharepointkris.com
www.sp2010blog.com
www.cospug.net
www.bostonsharepointug.org
member.itknowledgesale.com
maventor.com
sharepoint.softwebsolutions.com
www.phillysharepoint.org
www.wssclassroom.com
www.russbasiura.com
www.blueberryit.co.nz
www.phillysharepoint.com
demo2010.binaryrepublik.com
blogs.rbaconsulting.com
www.joelstamey.com
www.baileypoint.com
|

# Matches #
matches [

	# GHDB Match
	{ :certainty=>75, :ghdb=>'+"Please enable scripts and reload this page. If your browser does not support script, then you can visit the minimal version of this site at"' },

	# Default meta content
	{ :text=>'<meta name="GENERATOR" content="Microsoft SharePoint" /><meta name="progid" content="SharePoint.WebPartPage.Document" /><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="Expires" content="0" />' },

]

# Passive #
def passive
	m=[]

	# MicrosoftSharePointTeamServices HTTP Header
	m << { :version=>@meta["microsoftsharepointteamservices"].to_s } unless @meta["microsoftsharepointteamservices"].nil?

	# Return passive matches
	m

end

end

