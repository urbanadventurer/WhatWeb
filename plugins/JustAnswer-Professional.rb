##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "JustAnswer-Professional" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "JustAnswer Professional Script is a PHP script that lets you start your own question answer website just like JustAnswer."
website "http://www.guruscript.com/"

# 5 for inurl:forum_answer.php?que_id= "Powered By Guruscript.com"

# Dorks #
dorks [
'inurl:forum_answer.php?que_id= "Powered By Guruscript.com"'
]



# Matches #
matches [

# Powered by text # Shared by other Guruscript.com scripts
{ :certainty=>25, :text=>'<td align=center>Powered By <a href="http://guruscript.com">Guruscript.com</a></td></tr></table></div></body></html>' },

# Register link # register.php?typ=expert&que_id=
{ :regexp=>/<a href="register\.php\?typ=expert&que_id=[\d]+">Click here<\/a> to answer this question\./ },

# Logout link HTML
{ :text=>'<img src="images/settings.png" style="vertical-align:middle;" />&nbsp;<a href="logout.php" class="cpanel_a">Logout </a><br>' },

]

end

