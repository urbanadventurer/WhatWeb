##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Outlook-Web-App" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-06
version "0.1"
description "Outlook Web App (OWA), originally called Outlook Web Access and before that Exchange Web Connect (EWC), is a webmail service of Microsoft Exchange Server 5.0 and later. OWA is used to access e-mail (including support for S/MIME), calendars, contacts, tasks, and other mailbox content when access to the Microsoft Outlook desktop application is unavailable. In the Exchange 2007 release, OWA also offers read-only access to documents stored in Microsoft SharePoint sites and network (UNC) shares. Microsoft provides Outlook Web App as part of Exchange Server to allow users to connect remotely via a web browser. - Homepage: http://help.outlook.com/"
# More info: http://en.wikipedia.org/wiki/Outlook_Web_App

# Google results as at 2011-06-06 #
# 104 for inurl:"/owa/auth/logon.aspx?url="

# Dorks #
dorks [
'inurl:"/owa/auth/logon.aspx?url="'
]

# Examples #
examples %w|
https://outlook.symbiosystems.com/owa/
https://cassmail.city.ac.uk/owa/
https://remote.lpguys.com/owa/
https://mail.yzsddt.cn/owa/
https://mail.ncgrain.gov.cn/owa/
https://mail.pyramidregroup.com/owa/
https://remote.maceng.com.au/owa/
https://mail.specialtysand.com/owa/
https://mail.certifiedsitesafety.com/owa/
https://webmail.ribisecurity.com/owa/
https://remote.system-transport.no/owa/
|

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

# browser settings must allow scripts to run message HTML
{ :text=>'<td style="width:100%">To use Outlook Web App, browser settings must allow scripts to run. For information about how to allow scripts, consult the Help for your browser. If your browser doesn\'t support scripts, you can download <a href="http://www.microsoft.com/windows/ie/downloads/default.mspx">Windows Internet Explorer</a> for access to Outlook Web App.</td>' },

]

# Passive #
def passive
	m=[]

	# Version Detection # x-owa-version HTTP Header
	m << { :version=>@headers["x-owa-version"].to_s } unless @headers["x-owa-version"].nil?

	# Return passive matches
	m
end

end

