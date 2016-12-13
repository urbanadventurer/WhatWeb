##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BMC-Remedy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-11
version "0.1"
description "BMC Remedy Action Request System (also known as Remedy, AR System and ARS) is a client-server software application development environment from BMC Software (originally developed by Remedy Corporation). BMC Remedy Mid-Tier is a server component in the Action Request System for web access."
website "http://www.bmc.com/products/offering/itsm-premise-ondemand.html"

# More Info #
# http://en.wikipedia.org/wiki/BMC_Remedy_Action_Request_System
# http://en.wikipedia.org/wiki/AR_Mid-Tier

# Google results as at 2011-07-11 #
# 103 for intitle:"Remedy Mid Tier" "User Name" +Password

# Dorks #
dorks [
'intitle:"Remedy Mid Tier" "User Name" "Password"'
]



# Matches #
matches [

# Login Page # HTML Comment
{ :text=>'<!-- common to all login jsps - not localized information -->' },

# Login Page # HTML Comment
{ :text=>'<!-- Added to prevent iFrame exploit. Need to comment out for portlet to work -->' },

# Login Page # Clear form button
{ :text=>'<input type="button" name="clear" value="Clear" class="Login" onClick="clearLogin();"><!--;-->' },
{ :text=>'<input type="button" name="clear" value="Clear" onClick="clearLogin();"><!--;-->' },

# Version Detection # Title
{ :version=>/<title>(BMC&nbsp;)?Remedy&nbsp;Mid&nbsp;Tier&nbsp;([^\s]+) - (Error page|Login)<\/title><!--;-->/, :offset=>1 },
{ :version=>/<title>(BMC )?Remedy Mid Tier ([^\s]+) - (Error page|Login)<\/title>/, :offset=>1 },

]

end

