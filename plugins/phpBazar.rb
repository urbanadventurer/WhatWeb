##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpBazar" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-29
version "0.1"
description "PHP3/PHP4/mySql Classified AD and/or Matchmaking"
website "http://www.smartisoft.com/"

# Google results as at 2011-01-29 #
# 12 for intitle:"phpBazar-AdminPanel" -intitle

# Dorks #
dorks [
'intitle:"phpBazar-AdminPanel" -intitle'
]



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


