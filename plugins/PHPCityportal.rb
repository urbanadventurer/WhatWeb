##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHPCityportal" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-12-07
version "0.1"
description "PHPCityportal - build your own business portal - Requires PHP and MySQL"
website "http://phpcityportal.com/"

# Google results as at 2011-12-07 #
# 28 for "Powered by PHPCityPortal.com" inurl:"login.php"

# Dorks #
dorks [
'"Powered by PHPCityPortal.com" inurl:"login.php"'
]



# Matches #
matches [

# Meta Author
{ :certainty=>75, :text=>'<meta name="author" content="Cr8Soft" />' },

# Powered by link
{ :text=>'<center><a href="http://phpcityportal.com">Powered by PHPCityPortal.com</a></center><p>' },

# Powered by link # Older Versions
{ :text=>'<center><a href="http://www.phpcityportal.com/index.php">Powered by PHPCityPortal.com</a></center>' },

# frm_login_left
{ :text=>'<form id="frm_login_left" name="frm_login_left" action="includes/check_user.php" method="post">' },

# frm_login_left # Older Versions
{ :text=>'<form id="frm_login_left" name="frm_login_left" action="includes/check_user.php.inc" method="post">' },

]

end

