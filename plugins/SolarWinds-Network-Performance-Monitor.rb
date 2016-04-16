##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Added version detection. Updated matches.
##
Plugin.define "SolarWinds-Network-Performance-Monitor" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-31
version "0.2"
description "Our flagship network monitoring software manages dynamic networks of all sizes, simply and affordably. Discover how easy it is to detect, diagnose, and resolve network problems with Orion Network Performance Monitor (NPM)."
website "http://www.solarwinds.com/products/orion/"
# Manual: http://www.solarwinds.com/support/Orion/docs/OrionQuickStartGuide.pdf

# 2 ShodanHQ results for "Location: /Admin/CriticalError.asp"
# 2 Google results for "Cannot access main SQL Server database" intitle:"SolarWinds Network Management"
# 14 results for inurl:netperfmon
# 2 results for inurl:Orion inurl:login ext:aspx intitle:"Orion Network Performance Monitor"


matches [

# Error page # Cannot access main SQL Server database error text
{ :string=>"Broken", :text=>"<b>Cannot access main SQL Server database.</b><br><br><b>Connection</b>" },

# Default Title
{ :text=>'<TITLE>SolarWinds Network Management</TITLE>' },

# Default TD Heading
{ :text=>'<TD Class=PageHeader>Network Performance Monitor</TD>' },

# Old versions # Default CSS HTML
{ :text=>'<link rel="stylesheet" type="text/css" href="/SolarWinds.css">', :version=>"Old" },

# Default Title
{ :regexp=>/<title>[\r\n]*	Orion Network Performance Monitor[\r\n]*<\/title>/ },

# Default CSS HTML
{ :text=>'<link rel="stylesheet" type="text/css" href="/SolarWinds.css" />' },

# Default HTML Comment
{ :text=>'<!-- Stylesheets left here to support legacy resources -->' },

# Default Logo HTML 
{ :text=>'<img src="/NetPerfMon/images/SolarWinds.Logo.gif" alt="Site Logo"/>' },

# Default Logo HTML
{ :text=>'<img src="../NetPerfMon/images/SolarWinds.Logo.jpg" border=0>' },
{ :text=>'<img src="/NetPerfMon/images/SolarWinds.Logo.jpg" border=0>' },

# Error page # Default Malformed HTML
{ :text=>'<a href="/Login.asp"><u><b>Retry Login<b><u></a>' },

# Version detection # Copyright text
{ :version=>/<div id="footer">[^S]*SolarWinds Orion Network Performance Monitor ([^&]+)&copy; 1995-[0-9]{4} All Rights Reserved[^<]*<\/div>/ },

]

# Passive #
def passive
	m=[]

	# HTTP Location Header
	m << { :string=>"Broken" } if @headers["location"] =~ /\/Admin\/CriticalError.asp\?ErrorMessage=<b>Cannot%20access%20main%20SQL%20Server%20database.<\/b>/

	m

end

end

