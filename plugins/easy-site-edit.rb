##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Easy-Site-Edit" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-22
version "0.1"
description "EasySiteEdit CMS"
website "http://www.easysiteedit.com/"

# Local file path and FTP username:password are disclosed by install.php #

# Google results as at 2011-08-22 #
# 4 for "Powered by Easy Site-Edit"

# Dorks #
dorks [
'"Powered by Easy Site-Edit"'
]



# Matches #
matches [

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/www\.easysiteedit\.com" class="link(tahoma11)?[^"]*" target="_blank">Easy Site-Edit<\/a>/ },

# FTP username # install.php
{ :account=>/<TD bgcolor=#(F7FDFF|FFFFFF)>FTP User Name<\/TD>[\s]+<TD bgcolor=#(F7FDFF|FFFFFF)><INPUT TYPE="text" NAME="user_name" value="([^"]+)" class="textboxset(enlarge)?">(<p>\[&nbsp;Note:&nbsp;Ftp user name to login into the server&nbsp;\]<\/p>|&nbsp;&nbsp;&nbsp;\(Ftp user name to login into the server\))<\/TD>/, :offset=>2 },

# FTP password # install.php
{ :account=>/<TD bgcolor=#(F7FDFF|FFFFFF)>FTP User Password<\/TD>[\s]+<TD bgcolor=#(F7FDFF|FFFFFF)><INPUT TYPE="password" NAME="user_pass" value="([^"]+)" class="textboxset(enlarge)?">(&nbsp;&nbsp;&nbsp;\(Ftp password to login into the server\)|<p>[&nbsp;Note:&nbsp;Ftp password to login into the server&nbsp;]<\/p>)<\/TD>/, :offset=>2 },

# Filepath # install.php
{ :filepath=>/<TD bgcolor=#(F7FDFF|FFFFFF)>FTP Directory of CMS<\/TD>[\s]+<TD bgcolor=#(F7FDFF|FFFFFF)><INPUT TYPE="text" NAME="dir_cms" value="([^"]+)" class="textboxset(enlarge)?">(&nbsp;&nbsp;&nbsp;\(Directory path of cms in the remote server.\)|<p>\[&nbsp;Note:&nbsp;Directory path of cms in the remote server&nbsp;\]<\/p>)<\/TD>/, :offset=>2 },

]

end

