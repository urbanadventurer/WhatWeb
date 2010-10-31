##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SolarWinds-Network-Performance-Monitor" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-31
version "0.1"
description "Our flagship network monitoring software manages dynamic networks of all sizes, simply and affordably. Discover how easy it is to detect, diagnose, and resolve network problems with Orion Network Performance Monitor (NPM). - homepage: http://www.solarwinds.com/products/orion/"
# Manual: http://www.solarwinds.com/support/Orion/docs/OrionQuickStartGuide.pdf

# 2 ShodanHQ results for "Location: /Admin/CriticalError.asp"
# 2 Google results for "Cannot access main SQL Server database" intitle:"SolarWinds Network Management"
examples %w|
205.214.205.46
oriondemo.solarwinds.com
|

matches [

# Error page # Cannot access main SQL Server database error text
{ :string=>"Broken", :text=>"<b>Cannot access main SQL Server database.</b><br><br><b>Connection</b>" },

# Default Title
{ :text=>'<TITLE>SolarWinds Network Management</TITLE>' },

# Default TD Heading
{ :text=>'<TD Class=PageHeader>Network Performance Monitor</TD>' },

# Default CSS HTML
{ :text=>'<link rel="stylesheet" type="text/css" href="/SolarWinds.css">' },

# 10.x # Default Title
{ :regexp=>/<title>[\s]*Orion Network Performance Monitor[\s]*<\/title>/, :version=>"10.x" },

# 10.x # Default CSS HTML
{ :text=>'<link rel="stylesheet" type="text/css" href="/SolarWinds.css" />', :version=>"10.x" },

# 10.x # Default HTML Comment
{ :text=>'<!-- Stylesheets left here to support legacy resources -->', :version=>"10.x" },

# 10.x # Default Logo HTML 
{ :text=>'<img src="/NetPerfMon/images/SolarWinds.Logo.gif" alt="Site Logo"/>', :version=>"10.x" },

# Default Logo HTML
{ :text=>'<img src="../NetPerfMon/images/SolarWinds.Logo.jpg" border=0>' },
{ :text=>'<img src="/NetPerfMon/images/SolarWinds.Logo.jpg" border=0>' },

# Error page # Default Malformed HTML
{ :text=>'<a href="/Login.asp"><u><b>Retry Login<b><u></a>' },

# Copyright Text
{ :text=>'<TD class=Copyright align=middle><A class=Copyright href="http://solarwinds.net/">SOLARWINDS.NET</A> Network Performance Monitor Version Copyright 1995-2007 SolarWinds.Net All Rights Reserved</TD>' },

]

# Passive #
def passive
	m=[]

	# HTTP Location Header
	m << { :string=>"Broken" } if @meta["location"] =~ /\/Admin\/CriticalError.asp\?ErrorMessage=<b>Cannot%20access%20main%20SQL%20Server%20database.<\/b>/

	m

end

end

