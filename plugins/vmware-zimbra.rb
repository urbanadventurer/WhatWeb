##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VMware-Zimbra" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-15
version "0.1"
description "Zimbra is a next-generation collaboration server that provides organizations greater overall flexibility and simplicity with integrated email, contacts, calendaring, sharing and document management plus mobility and desktop synchronization to users on any computer."
website "http://www.zimbra.com/products/"

# ShodanHQ results as at 2011-05-15 #
# 12,258 for ZM_TEST

# Google results as at 2011-05-15 #
# 9 for "Go offline with Zimbra Desktop" intitle:"Zimbra Web Client Log In"

# Dorks #
dorks [
'"Go offline with Zimbra Desktop" intitle:"Zimbra Web Client Log In"'
]



# Matches #
matches [

# Meta Description
{ :text=>'<meta name="description" content="Zimbra provides open source server and client software for messaging and collaboration. To find out more visit http://www.zimbra.com.">' },

# HTML Comment
{ :text=>'<!--div id="ZLoginAppName">Web Client</div-->' },

# Default Title
{ :text=>'<title>Zimbra Web Client Log In</title>' },

# h1 bannerLink link
{ :text=>'<h1><a href="http://www.zimbra.com/" id="bannerLink" target="_new">' },

# zLoginField
{ :text=>'<td><input id="password" class="zLoginField" name="password" type="password" value="" size="40"/></td>' },

# ZLoginWhatsThis div with ZLoginInfoMessage class
{ :text=>'<div id="ZLoginWhatsThis" class="ZLoginInfoMessage" style="display:none;"><center style="margin-bottom:3px;"><b>Client Types:</b></center>' },

# Legal notice footer
{ :text=>'<div id="ZLoginNotice" class="legalNotice-small"><a target="_new" href="http://www.zimbra.com">Zimbra</a> :: the leader in open source messaging and collaboration ::' },

]

# Passive #
def passive
	m=[]

	# ZM_TEST Cookie
	m << { :name=>"ZM_TEST Cookie" } if @headers["set-cookie"] =~ /ZM_TEST=true/

	# Return passive matches
	m
end

end

