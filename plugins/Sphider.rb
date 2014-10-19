##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sphider" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-23
version "0.1"
description "Sphider is a lightweight web spider and search engine written in PHP, using MySQL as its back end database."
website "http://www.sphider.eu/"

# Google results as at 2011-08-23 #
# 62 for intitle:"Sphider Admin Login" inurl:"admin" +Username +Password
# 36 for intitle:"Sphider installation script" intext:"Sphider installation script" inurl:"install.php"

# Dorks #
dorks [
'intitle:"Sphider Admin Login" inurl:"admin" "Username" "Password"',
'intitle:"Sphider installation script" intext:"Sphider installation script" inurl:"install.php"'
]



# Matches #
matches [

# Install Page # admin/install.php
{ :regexp=>/<html>[\s]+<head>[\s]+<title>[\s]+Sphider installation script\.[\s]+<\/title>[\s]+<LINK REL=STYLESHEET HREF="admin\.css" TYPE="text\/css">[\s]+<\/head>[\s]+<body>/ },

# Admin Page
{ :regexp=>/<title>Sphider Admin Login<\/title>[\s]+<LINK REL=STYLESHEET HREF="admin\.css" TYPE="text\/css">[\s]+<\/head>/ },

]

# An aggressive plugin could get the version from ./readme.txt #

end

