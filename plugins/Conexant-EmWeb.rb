# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Conexant-EmWeb" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.2"
description "This plugin identifies the Conexant-EmWeb DSL router web interface."
website "http://www.conexant.com/"

# Flexor 151 user Manual: http://www.voiptalk.org/products/pdf/Flexor_151_User_Manual.pdf

# ShodanHQ results as at 2010-10-30 #
# 54,859 ShodanHQ results for Conexant-EmWeb

# Google results as at 2010-10-30 #
# 4 for "The Login page is where you enter the Broadband User Name and" inurl:"/help.html" intitle:"help"
# 1 for intitle:"AT-iMG634WA" "System Information"
# 3 for intitle:"AT" "System Information" "Model Type" "Software Release" "Recovery Release"

# Dorks #
dorks [
'"The Login page is where you enter the Broadband User Name and" inurl:"/help.html" intitle:"help"'
]



# Matches #
matches [

# Authentication failed # Default table HTML and 401 status code
{ :text=>'<table border="1" cellpadding="0" cellspacing="0" scrolling="no" style="border-collapse: collapse"bordercolor="#FFFFFF" width="80%">', :status=>401 },

# Flexor 151 # Default page # Default title
{ :text=>'<title>Flexor 151 Home</title>', :model=>"Flexor 151" },

# Flexor 151 # Default page # Default working message HTML
{ :text=>'<td><b>Flexor 151</b> is connected and working properly, for more information', :model=>"Flexor 151" },

# Flexor 151 # Default page # Default menu HTML
{ :text=>'Advanced configuration: <a style="font-size: 90%" href="voice.html">Voice Settings</a>&nbsp;&nbsp;&nbsp;<a style="font-size: 90%" href="network.html">Network Settings</a>&nbsp;&nbsp;&nbsp;<a style="font-size: 90%" href="qos.html">QoS Settings</a>', :model=>"Flexor 151" },

# Flexor 151 # Default page # Default h2 HTML
{ :text=>'<h2><a class="lg" href="status.html">Flexor 151</a></h2>', :model=>"Flexor 151" },

# e-con TDL-3424M # Default page # Default HTML
{ :text=>'<tr valign="middle"><td class="tmainhead"><img src="/webconfig/images/blank.gif" width="49" height="10" alt="" hspace="0" vspace="0" align="top" id="logospacer">e-con TDL-3424M Ethernet Router</td></tr>', :model=>"e-con TDL-3424M" },

# Allied Telesyn-iMG634WA # Default title
{ :text=>"<TITLE>AT-iMG634WA</TITLE>", :model=>"Allied Telesyn-iMG634WA" },

# Allied Telesyn-iMG606BD # Default title
{ :text=>"<TITLE>AT-iMG606BD</TITLE>", :model=>"Allied Telesyn-iMG606BD" },

# Allied Telesyn-iMG646BD # Default title
{ :text=>"<TITLE>AT-iMG646BD</TITLE>", :model=>"Allied Telesyn-iMG646BD" },

# Allied Telesyn # Default logo
{ :md5=>"1ddf1d795d6576316495844f824dc84f", :url=>"/images/banner2.gif", :model=>"Allied Telesyn-iMG634WA" },

# Allied Telesyn # Default logo
{ :md5=>"27bc3ddd5ca0799f0a9e1035f76b390c", :url=>"/images/banner2.gif", :model=>"AT-iMG646BD / AT-iMG606BD" },

# Allied Telesyn-iMG634A-R2 # Help page
{ :text=>'<p class="help_data"><b>Note:</b> If "Checking Firmware Upgrades Automatically" or "Image Upgrade" fails then please contact your service provider.</p>', :url=>"/help.html", :model=>"Allied Telesyn-iMG634A-R2" },

# Server version
{:version=>/Conexant-EmWeb\/([^\r^\n]+)/, :search=>"headers[server]"},
{:version=>/Virata-EmWeb\/([^\r^\n]+)/, :search=>"headers[server]"},


]

# Passive #
def passive
	m=[]

	# Check HTTP Header
	if @headers["server"] =~ /Conexant-EmWeb\/([^\r^\n]+)/ or @headers["server"] =~ /Virata-EmWeb\/([^\r^\n]+)/

		# e-con # Model Detection # Default page # Default Logo
		m << { :model=>"e-con "+@body.scan(/<img src="\/webconfig\/images\/logo.gif" alt="LOGO" title="LOGO" hspace="0" vspace="0" width="220" height="45"><\/td><td class="rbtop" width="100%"><h1 class="pname">e-con ([^\s]+) Ethernet Router<\/h1>/).flatten.first } if @body =~ /<img src="\/webconfig\/images\/logo.gif" alt="LOGO" title="LOGO" hspace="0" vspace="0" width="220" height="45"><\/td><td class="rbtop" width="100%"><h1 class="pname">e-con ([^\s]+) Ethernet Router<\/h1>/	

	end

	m

end

# Aggressive #
def aggressive
	m=[]

	# Check HTTP Header
	if @headers["server"] =~ /Conexant-EmWeb\/([^\r^\n]+)/ or @headers["server"] =~ /Virata-EmWeb\/([^\r^\n]+)/

		# Allied Telesyn # Status page
		target = URI.join(@base_uri.to_s,"/status/Status_1.htm").to_s
		status,url,ip,body,headers=open_target(target)

		# Allied Telesyn # Status page # Model Detection
		m << { :url=>"/status/Status_1.htm", :model=>"Allied Telesyn-"+body.scan(/<TD WIDTH="30%"><STRONG>Model Type<\/STRONG><\/TD>[\r\n\s]*<TD>([^<]+)<\/TD>/).flatten } if body =~ /<TD WIDTH="30%"><STRONG>Model Type<\/STRONG><\/TD>[\r\n\s]*<TD>([^<]+)<\/TD>/

		# Allied Telesyn # Status page # MAC Address
		m << { :url=>"/status/Status_1.htm", :string=>body.scan(/<TD><STRONG>MAC Address<\/STRONG><\/TD>[\r\n\s]*<TD>([^<]+)<\/TD>/).flatten } if body =~ /<TD><STRONG>MAC Address<\/STRONG><\/TD>[\r\n\s]*<TD>([^<]+)<\/TD>/


		# Allied Telesyn # iMG634A-R2 # Top frame
		target = URI.join(@base_uri.to_s,"/webconfig/atl/top_frame.html").to_s
		status,url,ip,body,headers=open_target(target)
		m << { :url=>"/webconfig/atl/top_frame.html", :model=>body.scan(/^[\s]+<em>([^<]+)<\/em>/).flatten } if body =~ /^[\s]+<em>([^<]+)<\/em>/


		# Allied Telesyn # iMG646BD / iMG606BD # Top frame
		target = URI.join(@base_uri.to_s,"/ati_header_frame.html").to_s
		status,url,ip,body,headers=open_target(target)
		m << { :url=>"/ati_header_frame.html", :model=>body.scan(/^[\s]+<em>([^<]+)<\/em>/).flatten } if body =~ /^[\s]+<em>([^<]+)<\/em>/

	end

	m

end

end

