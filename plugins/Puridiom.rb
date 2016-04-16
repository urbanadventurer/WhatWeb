##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Puridiom" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-14
version "0.1"
description "Puridiom - eProcurement software"
website "http://www.puridiom.com/"

# Google results as at 2011-07-14 #
# 5 for intitle:"Enabling Self-Service Procurement" "Loading Page"

# Dorks #
dorks [
'intitle:"Enabling Self-Service Procurement" "Loading Page"'
]



# Matches #
matches [

# Title
{ :text=>'<TITLE>Puridiom, Enabling Self-Service Procurement</TITLE>' },

# Title # Xpress
{ :string=>"Xpress", :text=>'<TITLE>Puridiom Xpress, Enabling Self-Service Procurement</TITLE>' },

# iframe id="getInfoFrame"
{ :text=>'<iframe id="getInfoFrame" name="getInfoFrame" src="/puridiom/system/processing.jsp"' },

# Loading Page
{ :text=>'<tr><td width=100% align=center valign=top><br><b>Loading Page... Please wait.</b><br><br><br><img src="/puridiom' },

# Version Detection # Title
{ :version=>/<TITLE>Puridiom ([\d\.]+), Enabling Self-Service Procurement<\/TITLE>/ },

# Meta Description
{ :text=>'<META NAME="Description" Content="/puridiom/system/header.jsp">' },

# Meta Description # Xpress
{ :string=>"Xpress", :text=>'<META NAME="Description" Content="/puridiomx/system/header.jsp">' },

]

end

