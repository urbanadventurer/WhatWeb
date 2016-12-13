##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # Brendan Coles <bcoles@gmail.com>
# Renamed to Microsoft-Windows-Business-Server
# Added Remote Web Workplace module detection
##
# Version 0.2
# removed :certainty=>100 & :name
##
Plugin.define "Microsoft-Windows-Business-Server" do
author "Andrew Horton"
version "0.3"
description "Microsoft Small/Essential Business Server"
website "http://www.microsoft.com/"

# Microsoft Small Business Server homepage: homepage:www.microsoft.com/sbs/
# Windows Essential Business Server homepage: http://www.microsoft.com/ebs/
# The Remote Web Workplace is a feature of Microsoft's Windows Small Business Server and the midsize business-focused product, Windows Essential Business Server, which enables pre-created users to log in to a front-end network-facing interface of the small business server.

# 48 Google results for "In order to use all of the features available in Remote Web Workplace, you must enable JavaScript for your Web browser." @ 2010-12-30
# 6 ShodanHQ results for /Remote/logon.aspx ReturnUrl=%2fRemote @ 2010-12-30
# 139 results for intitle:"Welcome to Windows Small Business Server 2003" @ 2011-01-03

# Dorks #
dorks [
'intitle:"Welcome to Windows Small Business Server 2003"'
]



# Matches #
matches [

# 2003 # Default title
{ :version=>2003, :text=>'<title>Welcome to Windows Small Business Server 2003</title>' },

# 2008 # Default title
{ :version=>2008, :text=>'<title>Welcome to Windows Small Business Server 2008</title>' },

# 2003 # Remote Web Workplace link
{ :text=>'<TD id="Remote_Link" class="linkHeader"><A HREF="/Remote">Remote Web Workplace</A></TD>' },

# 2003 # Default logo HTML
{ :certainty=>75, :text=>'<IMG alt="" src="images/sbslogo.gif" border="0" width="200" height="55">' },

# Remote Web Workplace # Default title and stylesheet tags
{ :text=>'</title><link href="signinStyle.css" rel="stylesheet" type="text/css" />', :module=>"Remote Web Workplace" },

# Remote Web Workplace # Default form tag HTML
{ :regexp=>/<form name="form1" method="post" action="logon\.aspx\?ReturnUrl=%2f[^"]" id="form1" autocomplete="OFF" onsubmit="OnUserNameFocus\(\);">/, :module=>"Remote Web Workplace" },

# Remote Web Workplace # Default remember me link
{ :text=>'<input id="rememberMe" type="checkbox" name="rememberMe" tabindex="3" /><label for="rememberMe">Remember me on this computer</label>', :module=>"Remote Web Workplace" },

# Remote Web Workplace # Default meta copyright
{ :text=>'<meta name="copyright" content="Copyright (c) Microsoft Corporation.  All rights reserved." />', :module=>"Remote Web Workplace", :certainty=>25 },

# Remote Web Workplace # Default head, meta content and title
{ :text=>'<head id="Head1"><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>', :module=>"Remote Web Workplace", :certainty=>25 },

]

end

