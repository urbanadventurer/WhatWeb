##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-08-23 #
# Added version detection
##
Plugin.define "WeBid" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-17
version "0.1"
description "Open source php/mysql fully featured auction script."
website "http://www.webidsupport.com/"

# ShodanHQ results as at 2011-06-17 #
# 26 for WEBID_ONLINE

# Google results as at 2011-06-17 #
# 243 for "powered by WeBid"
# 7 for "WeBid Installer" inurl:"install.php" ext:php

# Dorks #
dorks [
'"powered by WeBid"'
]



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="WeBid">' },

# Year Detection # Powered by footer
{ :string=>/Powered by <a href="http:\/\/www\.webidsupport\.com\/">WeBid<\/a> &copy; 2008\s?[,-] ([\d]{4}) <a href="http:\/\/www\.webidsupport\.com\/">WeBid<\/a>/ },

# WEBID_ONLINE cookie
{ :search=>"headers[set-cookie]", :regexp=>/WEBID_ONLINE=[a-f\d]{32};/ },

# Version Detection # ./install/install.php
{ :version=>/<h1>WeBid Installer v([^\s^>]+)<\/h1>[\s]*<form name="form1" method="post" action="\?step=1">/ },

]

end

