##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BackupPC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "BackupPC is a high-performance, enterprise-grade system for backing up Linux, WinXX and MacOSX PCs and laptops to a server's disk."
website "http://backuppc.sourceforge.net/"

# ShodanHQ results as at 2011-08-20 #
# 75 for BackupPC_Admin

# Google results as at 2011-08-20 #
# 1 for intitle:"BackupPC Server Status" inurl:BackupPC_Admin

# Dorks #
dorks [
'intitle:"BackupPC Server Status" inurl:BackupPC_Admin'
]



# Matches #
matches [

# GHDB
{ :certainty=>75, :ghdb=>'inurl:"/cgi-bin/BackupPC_Admin"' },

# input value="hostInfo"
{ :text=>'<input type="hidden" name="action" value="hostInfo"><input type="submit" value="Go" name="ignore">' },

# body onLoad
{ :text=>'</head><body onLoad="document.getElementById(\'NavMenu\').style.height=document.body.scrollHeight">' },

# WWW-Authenticate Header
{ :search=>"headers[www-authenticate]", :regexp=>/Basic realm="(Backup Admin|BackupPC admin|backuppc)"/ },

# Location Header
{ :url=>"/", :search=>"headers[location]", :regexp=>/\/cgi-bin\/BackupPC_Admin$/ },

]

end

