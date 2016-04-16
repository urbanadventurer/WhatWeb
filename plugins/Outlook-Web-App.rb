##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-08-08 # Brendan Coles <bcoles@gmail.com> #
# Updated matches and version detection
##
Plugin.define "Outlook-Web-App" do
author "Aung Khant <http://yehg.net/>" # 2011-02-03
version "0.2"
description "Outlook Web App (OWA), originally called Outlook Web Access and before that Exchange Web Connect (EWC), is a webmail service of Microsoft Exchange Server 5.0 and later. OWA is used to access e-mail (including support for S/MIME), calendars, contacts, tasks, and other mailbox content when access to the Microsoft Outlook desktop application is unavailable. In the Exchange 2007 release, OWA also offers read-only access to documents stored in Microsoft SharePoint sites and network (UNC) shares. Microsoft provides Outlook Web App as part of Exchange Server to allow users to connect remotely via a web browser."
website "http://help.outlook.com/"
# More info: http://en.wikipedia.org/wiki/Outlook_Web_App

# Google results as at 2011-06-06 #
# 125 for "To protect your account from unauthorized access, Outlook Web Access" intitle:"Microsoft Outlook Web Access"
#  76 for inurl:"/owa/auth/logon.aspx?url="

# Dorks #
dorks [
'"To protect your account from unauthorized access, Outlook Web Access" intitle:"Microsoft Outlook Web Access"',
'inurl:"/owa/auth/logon.aspx?url="'
]



# Matches #
matches [

# body class="owaLgnBdy"
{ :text=>'<body class="owaLgnBdy">' },

# Version Detection # logon.css path
{ :version=>/<link type="text\/css" rel="stylesheet" href="\/owa\/([^\s^\/]+)\/themes\/base\/logon\.css">/ },

# Version Detection # warn.png path
{ :version=>/<td><img src="\/owa\/([^\s^\/]+)\/themes\/base\/warn\.png"><\/td>/ },

# Version Detection # shortcut icon path
{ :version=>/<link rel="shortcut icon" href="\/owa\/([^\s^\/]+)\/themes\/base\/favicon\.ico" type="image\/x-icon">/ },

# HTML Comment
{ :text=>'<!-- OwaPage = ASP.auth_logon_aspx -->' },

# Form
{ :regexp=>/<FORM action="(\/CookieAuth\.dll\?Logon|\/exchweb\/bin\/auth\/owaauth\.dll)" method="POST" name="logonForm"/i },

# URL Pattern # /exchweb/bin/auth/owalogon.asp
{ :ghdb=>'inurl:/exchweb/bin/auth/owalogon.asp' },

# /exchweb/bin/auth/owalogon.asp?url=https://1&reason=2 # You could not be logged on to
{ :name=>'html body', :url=>'/exchweb/bin/auth/owalogon.asp?url=https://1&reason=2',:text=>'<TR><TD><P style="color:red">You could not be logged on to'},

# /CookieAuth.dll?GetLogon?url=/&reason=2 # You could not be logged on to
{:name=>'html body', :url=>'/CookieAuth.dll?GetLogon?url=/&reason=2',:text=>'<TR><TD><P style="color:red">You could not be logged on to'},

# Title
{ :name=>'html title', :text=>'<TITLE>Microsoft Outlook Web Access</TITLE>' },

# Edition Year Detection
{ :string=>/<IMG title="Microsoft Office Outlook Web Access provided by Microsoft Exchange Server ([\d]{4})" alt="Microsoft Office Outlook Web Access provided by Microsoft Exchange Server ([\d]{4})" height=62 src="\/exchweb\/img\/logon_logo\.gif" width=331 border=0 hspace=0>/ },

# browser settings must allow scripts to run message HTML
{ :text=>'<td style="width:100%">To use Outlook Web App, browser settings must allow scripts to run. For information about how to allow scripts, consult the Help for your browser. If your browser doesn\'t support scripts, you can download <a href="http://www.microsoft.com/windows/ie/downloads/default.mspx">Windows Internet Explorer</a> for access to Outlook Web App.</td>' },

]

# Passive #
def passive
	m=[]

	# Version Detection # x-owa-version HTTP Header
	m << { :version=>@headers["x-owa-version"].to_s } unless @headers["x-owa-version"].nil?

	# Active Directory Domain Detection
	if @body =~ /<!--Copyright \(c\) 2000-20[\d]{2} Microsoft Corporation\.  All rights reserved\.-->/
		if @body =~ /logonForm\.username\.value[\s]*=[\s]*"([^"^\\]+)\\\\"/i
			m << { :string=>"AD Domain: #{$1}" }
		elsif @body =~ /document\.getElementById\("username"\)\.value = '([^']+)'/i
			m << { :string=>"AD Domain: #{$1}" }
		end
	end

	# Return passive matches
	m
end
end

