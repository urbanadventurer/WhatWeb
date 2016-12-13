##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NeXpose-Security-Console" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-05
version "0.1"
description "NeXpose Security Console - Identifying vulnerabilities across networks, operating systems, databases, Web applications and a wide-range of system platforms through an integrated, intelligent scan engine, Rapid7 NeXpose prioritizes vulnerabilities using exploit risk scoring and asset criticality ratings. As a result, NeXpose customers benefit from lower risk exposure and remediation costs."
website "http://www.rapid7.com/products/vulnerability-management.jsp"

# 1 Google result for "JavaScript must be enabled before you can continue." @ 2011-01-05



# TODO # Fingerprint using certificate :
#   ERROR: certificate common name `NeXpose Security Console' doesn't match requested host name `candi4.cirt.vt.edu'.

# Matches #
matches [

	# Default Favicon HTML
	{ :text=>'<link rel="shortcut icon" href="/style/image/favicon.ico" type="image/vnd.microsoft.icon"></link>' },

	# Default Favicon
	{ :md5=>"e19ffb2bc890f5bdca20f10bfddb288d", :url=>"/style/image/favicon.ico" },

	# Login Page # Default JavaScript
	{ :text=>'<script src="/scripts/nexpose-skin.js" type="text/javascript"></script>' },
	{ :text=>"document.title = 'Log in to ' + document.nxp.skin.getProductName();" },

	# Login Page # Default form HTML
	{ :text=>'<input type="password" id="nexposeccpassword" name="nexposeccpassword" size="12"/>' },
	{ :text=>'<input type="password" id="nexposeccpassword" name="nexposeccpassword" size="12"></input>' },

	# Login Page # Default noscript HTML
	{ :text=>'<noscript><div class="LoginDialog">JavaScript must be enabled before you can continue.</div></noscript>' },

	# Error page # Default JavaScript
	{ :text=>'   <script type="text/javascript" src="/scripts/nexpose.js"></script>' },
	{ :text=>'   <script type="text/javascript" src="/scripts/nexpose-skin.js"></script>' },
	{ :text=>'   <script type="text/javascript" src="/scripts/nexpose-features.js"></script>' },

	# Error page # Default Title
	{ :text=>'<title>NeXpose Security Console :: Error</title>' },

]

# Aggressive #
def aggressive
	m=[]

	# /style/ # Trigger error message
	target = URI.join(@base_uri.to_s,"/style/").to_s
	status,url,ip,body,headers=open_target(target)
	m << { :name=>"Default Error Page Title" } if body =~ /<title>NeXpose Security Console :: Error<\/title>/

	# Return passive matches
        m
end

end


