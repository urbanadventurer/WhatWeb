##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHPOpenChat" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-23
version "0.1"
description "PHPOpenChat is a high performance php-based chat server software for a live chat-room"
website "http://www.phpopenchat.org/"

# Google results as at 2011-08-23 #
# 13 for intitle:"PHPOpenChat Installation" inurl:"admin/install.php"
# 10 for "You don't read the INSTALL instructions!" "Use the PHPOpenChat-Installer to install and configure your chat." inurl:html

# Dorks #
dorks [
'intitle:"PHPOpenChat Installation" inurl:"admin/install.php"'
]



# Matches #
matches [

# ./html/
{ :regexp=>/<html><body bgcolor="white">[\s]+You don't read the INSTALL instructions!<br>[\s]+Use the <a href="admin\/install\.php">PHPOpenChat-Installer<\/a>[\s]+to install and configure your chat\.[\s]+<\/body><\/html>/ },

# ./html/admin/install.php
{ :regexp=>/<html>[\s]+<head>[\s]+<title>PHPOpenChat Installation<\/title>[\s]+<\/head>[\s]+<body>[\s]+<h2>PHPOpenChat Installer<\/h2>[\s]+Step: [\s]+&nbsp;<b><font color="red">1<\/font><\/b>&nbsp;&nbsp;<b>2<\/b>&nbsp;&nbsp;<b>3<\/b>&nbsp;&nbsp;<b>4<\/b>&nbsp;&nbsp;<b>5<\/b>&nbsp;[\s]+<table border=1>[\s]+<form action="install\.php" method="post">/ },

]

end

