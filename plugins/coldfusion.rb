##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2012-02-05 #
# Added header match. Updated matches. Updated version detection.
##
# Version 0.2 # 2011-04-25 #
# Added cookie matches
##
Plugin.define "ColdFusion" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-15
version "0.3"
description "Adobe ColdFusion application server and software enables developers to rapidly build, deploy, and maintain robust Internet applications for the enterprise."
website "http://www.adobe.com/products/coldfusion/"

# ShodanHQ results as at 2012-02-05 #
# 6,536 for page-completion-status
#   529 for page-completion-status Abnormal

# Google results as at 2011-04-25 #
# 30 for intitle:"ColdFusion Administrator Login"
# 72 for intitle:"Login / Admin Area" ext:cfm

# Dorks #
dorks [
'intitle:"ColdFusion Administrator Login"'
]



# Matches #
matches [

# Admin Page # Title
{ :text=>'	<title>ColdFusion Administrator Login</title>' },

# Admin Page # Meta Author
{ :regexp=>/<meta name="Author" content="Copyright (\(c\)\ )?[0-9]{4}-[0-9]{4} Macromedia( Corp|, Inc)\. All rights reserved\.">/ },

# Admin Page # JavaScript
{ :text=>"	{   document.write(\"<link rel='STYLESHEET' type='text/css' href='./cfadmin_ns.css'>\");}" },

# Admin Page # Form
{ :text=>'<form name="loginform" action="./enter.cfm" method="POST" onSubmit="cfadminPassword.value = hex_hmac_sha1(salt.value, hex_sha1(cfadminPassword.value));" >' },

# Admin Page # input name="cfadminPassword"
{ :text=>'<input name="cfadminPassword" type="Password" size="15" style="width:15em;" class="label" maxlength="100" id="admin_login">' },

# Admin Page # Copyright text
{ :text=>'	Macromedia, the Macromedia logo, Macromedia ColdFusion and ColdFusion are<br />' },

# Admin Page # Logo HTML
{ :text=>'	<tr><td><img src="./images/mx_copyrframe.gif" width="2" height="57" border="0" alt="ColdFusion MX" hspace="10"></td>' },

# /CFIDE/administrator/images/loginbackground.jpg # Version 9.x
{ :url=>'/CFIDE/administrator/images/loginbackground.jpg', :md5=>"596b3fc4f1a0b818979db1cf94a82220", :version=>"9.x" },

# /CFIDE/administrator/images/AdminColdFusionLogo.gif # Version 7.x
{ :url=>"/CFIDE/administrator/images/AdminColdFusionLogo.gif", :md5=>"620b2523e4680bf031ee4b1538733349", :version=>"7.x" },

# page-completion-status Header
{ :search=>"headers[page-completion-status]", :certainty=>75, :regexp=>/(Abnormal|Normal)/ },

# Set-Cookie # /CFAUTHORIZATION_cfadmin=/
{ :search=>"headers[set-cookie]", :regexp=>/CFAUTHORIZATION_cfadmin=/ },

]

# Passive #
def passive
	m=[]

	# CFID and CFTOKEN cookie
	if @headers["set-cookie"]=~ /CFID=/ and @headers["set-cookie"]=~ /CFTOKEN=/
		m << { :name=>"CFID and CFTOKEN cookie" }
	end

	# Version detection using admin panel text
	if @body =~ /Enter your RDS or Admin password below/

		if @body =~ /Version:[\s]*([^<]+)<\/strong><br \/>/
			m << { :version=>"#{$1}".gsub(/,/, ".") }
		end

	end

	# Return passive matches
	m
end

end

