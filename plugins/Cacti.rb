##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cacti" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "Cacti is a complete network graphing solution designed to harness the power of RRDTool's data storage and graphing functionality."
website "http://www.cacti.net/"

# Google results as at 2011-11-22 #
# 86 for inurl:"cacti/graph_view.php?action="
# 49 for "Please enter your Cacti user name and password below:" intitle:"Login to Cacti"

# Dorks #
dorks [
'inurl:"cacti/graph_view.php?action="'
]



# Matches #
matches [

# Login Page # title
{ :text=>'<title>Login to Cacti</title>' },

# Login Page # body tag
{ :text=>'<body bgcolor="#FFFFFF" onload="document.login.login_username.focus()">' },

]

end

