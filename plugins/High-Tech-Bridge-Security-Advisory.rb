##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "High-Tech-Bridge-Security-Advisory" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-13
version "0.1"
description "This plugin reads High-Tech Bridge security advisories, extracts the vulnerable software name and version, extracts the vulnerability type and attempts to extract any HTTP GET PoC URLs - homepage: http://www.htbridge.ch/advisory/"

# 91 results for inurl:"http://www.htbridge.ch/advisory/" ext:html @ 2011-01-13

# Examples #
examples %w|
www.htbridge.ch/advisory/path_disclosure_in_energine.html
www.htbridge.ch/advisory/sql_injection_vulnerability_in_energine.html
www.htbridge.ch/advisory/path_disclousure_in_phpmysport.html
www.htbridge.ch/advisory/sql_injection_in_phpmysport_2.html
www.htbridge.ch/advisory/xss_in_microsoft_sharepoint_server_2007.html
www.htbridge.ch/advisory/authentication_bypass_in_phpliteradmin.html
|

# Matches #
matches [

	# Vulnerability Type # Path Disclosure
	{ :text=>'<tr><td width=21%><b>Vulnerability Type:</b></td><td width=79%><a href="http://www.htbridge.ch/security_glossary/path_disclosure.html">Path disclosure</a></td></tr>', :module=>"Path Disclosure" },

	# Vulnerability Type # SQL Injection
	{ :text=>'<tr><td width=21%><b>Vulnerability Type:</b></td><td width=79%><a href="http://www.htbridge.ch/security_glossary/sql_injection.html">SQL Injection</a></td></tr>', :module=>"SQL Injection" },

	# Vulnerability Type # XSS (Cross Site Scripting)
	{ :text=>'<tr><td width=21%><b>Vulnerability Type:</b></td><td width=79%><a href="http://www.htbridge.ch/security_glossary/xss.html">XSS (Cross Site Scripting)</a></td></tr>', :module=>"XSS (Cross Site Scripting)" },

	# Vulnerability Type # Local File Inclusion
	{ :text=>'<tr><td width=21%><b>Vulnerability Type:</b></td><td width=79%>Local File Inclusion</td></tr>', :module=>"Local File Inclusion" },

	# Vulnerability Type # Directory Traversal
	{ :text=>'<tr><td width=21%><b>Vulnerability Type:</b></td><td width=79%>Directory Traversal Vulnerability</td></tr>', :module=>"Directory Traversal" },
	# Vulnerability Type # Authentication Bypass
	{ :text=>'<tr><td width=21%><b>Vulnerability Type:</b></td><td width=79%>Authentication bypass</td></tr>', :module=>"Authentication Bypass" },

]

# Passive #
def passive
	m=[]

	if @body =~ /<title>High-Tech Bridge SA - Advisories - / and @body =~ /<br \/><font color=#606060>/ and @body =~ /The following PoC is available:/

		# Extract product name and affected version
		m << { :version=>@body.scan(/<tr><td width=21%><b>Product:<\/b><\/td><td width=79%>([^<]*)<\/td><\/tr>/).to_s+" "+@body.scan(/<tr><td width=21%><b>Vulnerable Version:<\/b><\/td><td width=79%>([^<]*)<\/td><\/tr>/).to_s } if @body =~ /<tr><td width=21%><b>Vulnerable Version:<\/b><\/td><td width=79%>[^<]*<\/td><\/tr>/ and @body =~ /<tr><td width=21%><b>Product:<\/b><\/td><td width=79%>[^<]*<\/td><\/tr>/

		# Extract PoC URLs
		if @body =~ /<br \/><font color=#606060>[^<]*<\/font>/
			poc_urls=@body.scan(/<br \/><font color=#606060>([^<]*)<\/font>/)
			poc_urls.each do |poc|
				m << { :string=>poc.to_s }
			end
		end

	end

	m

end

end

