##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Microsoft-SQL-Server-Report-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "Microsoft SQL Server Report Manager - web-based report access and management tool"
website "http://msdn.microsoft.com/en-us/library/ms157147%28v=sql.90%29.aspx"

# ShodanHQ results as at 2012-08-26 #
# 19 for Reports/Pages/Folder.aspx

# Google results as at 2012-08-26 #
# 31 for "Send feedback" "rcwebhlp@microsoft.com" "Launch Help in Frameset" -ftp
# 31 for inurl:"Reports/Pages/Folder.aspx" "intitle:"Report Manager"

# Dorks #
dorks [
'inurl:"Reports/Pages/Folder.aspx" "intitle:"Report Manager"'
]



# Matches #
matches [

# Meta Generator # Version Detection
{ :version=>/<META Name="Generator" CONTENT="Microsoft SQL Server Report Manager ([^"]+)">/ },

# report link html
{ :text=>'<td valign="top" width="18px"><a href="/Reports/Pages/Folder.aspx?ItemPath=' },

# StyleSheet
{ :text=>'<link href="/Reports/styles/ReportingServices.css"type="text/css" rel="stylesheet">' },

# JavaScript
{ :text=>'<script language="JScript" type="text/Javascript" src="/Reports/js/ReportingServices.js"></script>' },

# Help Pages # Footer
{ :text=>'<a href="mailto:rcwebhlp@microsoft.com">Send feedback</a> to "rcwebhlp@microsoft.com" | <a href="index.htm" target="_top">Launch Help in Frameset</a>' },

# Help Pages # StyleSheet
{ :text=>'<body topmargin=0 id="bodyID" class = "dtBODY"><LINK REL="stylesheet" TYPE="text/css" HREF="sql.css">' },

# Location Header # /Reports/Pages/Folder.aspx
{ :search=>"headers[location]", :regexp=>/\/Reports\/Pages\/Folder\.aspx/i },

]

end

