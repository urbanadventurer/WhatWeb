##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Microsoft-Remote-Web-Workplace" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-30
version "0.1"
description "The Remote Web Workplace is a feature of Microsoft's Windows Small Business Server and the midsize business-focused product, Windows Essential Business Server, which enables pre-created users to log in to a front-end network-facing interface of the small business server."
website "http://microsoft.com/"

# 48 Google results for "In order to use all of the features available in Remote Web Workplace, you must enable JavaScript for your Web browser." @ 2010-12-30
# 6 ShodanHQ results for /Remote/logon.aspx ReturnUrl=%2fRemote @ 2010-12-30

# Dorks #
dorks [
'"In order to use all of the features available in Remote Web Workplace, you must enable JavaScript for your Web browser."'
]



# Matches #
matches [

# Default title and stylesheet tags
{ :text=>'</title><link href="signinStyle.css" rel="stylesheet" type="text/css" />' },

# Default form tag HTML
{ :regexp=>/<form name="form1" method="post" action="logon\.aspx\?ReturnUrl=%2f[^"]" id="form1" autocomplete="OFF" onsubmit="OnUserNameFocus\(\);">/ },

# Default remember me link
{ :text=>'<input id="rememberMe" type="checkbox" name="rememberMe" tabindex="3" /><label for="rememberMe">Remember me on this computer</label>', :certainty=>25 },

# Default meta copyright
{ :text=>'<meta name="copyright" content="Copyright (c) Microsoft Corporation.  All rights reserved." />', :certainty=>25 },

# Default head, meta content and title
{ :text=>'<head id="Head1"><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>', :certainty=>25 },

]

end


