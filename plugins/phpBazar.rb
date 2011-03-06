##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpBazar" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-29
version "0.1"
description "PHP3/PHP4/mySql Classified AD and/or Matchmaking - homepage: http://www.smartisoft.com/"

# Google results as at 2011-01-29 #
# 12 for intitle:"phpBazar-AdminPanel" -intitle

# Examples #
examples %w|
cometsquare.com/admin/admin.php
abcpetitesannonces.com/admin/admin.php
ex-sale.com/beta/admin/admin.php
www.eaa-mauritius.com/phpBazar-2.1.1fix/admin/admin.php
www.kmlogsdon.com/admin/admin.php
|

# Matches #
matches [

	# Default Title
	{ :text=>"<title>phpBazar-AdminPanel</title>", :module=>"Admin Page" },

	# Default login message
	{ :text=>"<br>Login to phpBazar with Admin- or Moderator-Level & use the Administration-Functions! ->" },

	# Version Detection # Footer text
	{ :version=>/<p><div class="footer">phpBazar Ver. ([\d\.]+) &copy 2001\-[\d]{4} by <a href="http:\/\/www.smartisoft.com[\/]?" target="_blank">SmartISoft<\/a><\/div>/ },

]

end


