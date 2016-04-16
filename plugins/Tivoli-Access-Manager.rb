##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tivoli-Access-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-05 #
version "0.1"
description "Tivoli Access Manager for e-business software is a highly scalable user authentication, authorization and Web SSO solution for enforcing security policies over a wide range of Web and application resources. It centralizes user access management for online portal and business initiatives."
website "Homepage: http://www.ibm.com/software/tivoli/products/access-mgr-e-bus/"

# ShodanHQ results as at 2011-03-05 #
# 98 for realm Access Manager for e-business

# Google results as at 2011-03-05 #
# 35 for intitle:"Access Manager for e-business Login"

# Dorks #
dorks [
'intitle:"Access Manager for e-business Login"'
]



# Matches #
matches [

# Default Title
{ :text=>'<TITLE>Access Manager for e-business Login</TITLE>' },

# Default Copyright HTML Comment
{ :text=>'<!-- Copyright (C) 2000 Tivoli Systems, Inc. -->' },

# Default HTML Comment
{ :text=>'<!--- DO NOT TRANSLATE OR MODIFY any part of the hidden parameter(s) --->' },

# Default JavaScript
{ :text=>'var warningString = "<B>WARNING:</B> To maintain your login session, make sure that your browser is configured to accept Cookies.";' },

]

# Passive #
def passive
	m=[]

	# WWW-Authenticate # realm="Access Manager for e-business"
	m << { :name=>'HTTP WWW Authenticate header' } if @headers['www-authenticate'] =~ /realm="Access Manager for e-business"/

	# Return passive matches
	m

end

end


