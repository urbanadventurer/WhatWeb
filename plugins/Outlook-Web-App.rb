##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-08-08 #
# Merged matches and Active Directory Domain detection from Aung Khant's plugin
##
Plugin.define "Outlook-Web-App" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-06
version "0.2"
description "Outlook Web App (OWA), originally called Outlook Web Access and before that Exchange Web Connect (EWC), is a webmail service of Microsoft Exchange Server 5.0 and later. OWA is used to access e-mail (including support for S/MIME), calendars, contacts, tasks, and other mailbox content when access to the Microsoft Outlook desktop application is unavailable. In the Exchange 2007 release, OWA also offers read-only access to documents stored in Microsoft SharePoint sites and network (UNC) shares. Microsoft provides Outlook Web App as part of Exchange Server to allow users to connect remotely via a web browser. - Homepage: http://help.outlook.com/"
# More info: http://en.wikipedia.org/wiki/Outlook_Web_App

# Google results as at 2011-06-06 #
# 125 for "To protect your account from unauthorized access, Outlook Web Access" intitle:"Microsoft Outlook Web Access"
#  76 for inurl:"/owa/auth/logon.aspx?url="

# Dorks #
dorks [
'"To protect your account from unauthorized access, Outlook Web Access" intitle:"Microsoft Outlook Web Access"',
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
https://webmail.ec.europa.eu/
https://phsexchweb.partners.org/
https://student-webmail.tvu.ac.uk/exchweb/bin/auth/owalogon.asp
https://webmail.inhs.org/exchweb/bin/auth/owalogon.asp
https://owa.vivetelmex.com/exchweb/bin/auth/owalogon.asp
https://email.btconnect.com/exchweb/bin/auth/owalogon.asp
https://apowa.csl.com.au/CookieAuth.dll
https://webems.rmit.edu.vn/exchweb/bin/auth/owalogon.asp
https://uspl.webmail.eds.com/exchweb/bin/auth/owalogon.asp
https://owa.mailseat.com/exchweb/bin/auth/owalogon.asp
https://mn-exch1.nes.nuclearholdings.co.uk/exchweb/bin/auth/owalogon.asp
http://www.davis-interiors.com/exchweb/bin/auth/owalogon.asp
https://medexch.med.unc.edu/exchweb/bin/auth/owalogon.asp
https://cpsmail.cps.k12.il.us/exchweb/bin/auth/owalogon.asp
https://82.93.236.51/exchweb/bin/auth/owalogon.asp
https://webmail.west.thomson.com/
https://ssl.esu.edu/exchweb/bin/auth/owalogon.asp
https://outlook.leeds.ac.uk/exchweb/bin/auth/owalogon.asp
https://www.mayerreed.com/exchweb/bin/auth/owalogon.asp
https://mail.apscuf.org/exchweb/bin/auth/owalogon.asp
https://www.compasscpagroup.com/exchweb/bin/auth/owalogon.asp
https://owa.nusd.k12.az.us/exchweb/bin/auth/owalogon.asp
https://remote.greatnorthwest.org/exchweb/bin/auth/owalogon.asp
https://mail.ual.com/
https://staffmail.telstraclear.co.nz/exchweb/bin/auth/owalogon.asp
https://smtp.wellsnursing.org/exchweb/bin/auth/owalogon.asp
https://webmail.co.multnomah.or.us/
https://www.jastrucking.com/exchweb/bin/auth/owalogon.asp
https://secure.mitchellinstallations.ca/exchweb/bin/auth/owalogon.asp
https://mail.lakeforrestprep.com/exchweb/bin/auth/owalogon.asp
https://eumail.bp.com/exchweb/bin/auth/owalogon.asp
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
	m << { :version=>@meta["x-owa-version"].to_s } unless @meta["x-owa-version"].nil?

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

