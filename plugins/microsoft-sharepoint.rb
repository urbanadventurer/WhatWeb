##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-06-04 #
# Updated regex
# Added matches
##
# Version 0.2 # 2011-01-24 #
# Added HTTP Header match
##
Plugin.define "Microsoft-Sharepoint" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-05 
version "0.3"
description "Microsoft SharePoint 2010 makes it easier for people to work together. Using SharePoint 2010, your people can set up Web sites to share information with others, manage documents from start to finish, and publish reports to help everyone make better decisions."
website "http://sharepoint.microsoft.com/"

# Google results as at 2011-06-04 #
# 371 for "You may be trying to access this site from a secured browser on the server. Please enable scripts and reload this page."
#  40 for "Please enable scripts and reload this page. If your browser does not support script, then you can visit the minimal version of this site at"

# ShodanHQ results as at 2011-06-04 #
# 43,542 for MicrosoftSharePointTeamServices
#     18 for exires
#     13 for x-sharepointhealthscore

# Dorks #
dorks [
'"You may be trying to access this site from a secured browser on the server. Please enable scripts and reload this page."'
]



# Matches #
matches [

	# noscript
	{ :certainty=>75, :text=>"<noscript><div class='noindex'>You may be trying to access this site from a secured browser on the server. Please enable scripts and reload this page.</div></noscript>" },
	{ :certainty=>75, :text=>"<noscript><div class='noindex'>Please enable scripts and reload this page. If your browser does not support script, then you can visit the minimal version of this site at <a href=" },

	# Meta CollaborationServer
	{ :certainty=>75, :text=>'<meta name="CollaborationServer" content="SharePoint Team Web Site" />' },

	# MSOWebPartPage_PostbackSource
	{ :text=>'<input type="hidden" name="MSOWebPartPage_PostbackSource" id="MSOWebPartPage_PostbackSource" value=' },

	# Meta Generator
	{ :text=>'<meta name="GENERATOR" content="Microsoft SharePoint" />' },

	# Meta progid
	{ :text=>'<meta name="progid" content="SharePoint.WebPartPage.Document" />' },

]

# Passive #
def passive
	m=[]

	# MicrosoftSharePointTeamServices HTTP Header
	m << { :version=>@headers["microsoftsharepointteamservices"].to_s } unless @headers["microsoftsharepointteamservices"].nil?

	# x-sharepointhealthscore HTTP Header
	m << { :name=>"x-sharepointhealthscore HTTP header" } unless @headers["x-sharepointhealthscore"].nil?

	# exires HTTP Header # Quality Assurance is for pussies
	# http://download.microsoft.com/download/8/5/8/858F2155-D48D-4C68-9205-29460FD7698F/%5BMS-WSSHP%5D.PDF
	# HTTP Windows SharePoint Services Headers Protocol Specification
	# Section 2.2.1 # Exires Header:
	# The Exires [sic] header and its value have no meaning. The protocol server SHOULD use the Expires header instead as specified in [RFC2616] section 14.21.
	m << { :certainty=>25, :name=>"exires HTTP header" } unless @headers["exires"].nil?

	# Return passive matches
	m
end

end

