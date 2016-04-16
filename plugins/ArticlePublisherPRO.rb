##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-07 #
# Updated version detection method
##
Plugin.define "ArticlePublisherPRO" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.2"
description "The Flexible and Easy Article Publishing System"
website "http://article-publisher-pro.phparticlescript.com/"

# Google results as at 2010-08-30 #
# 31 for "powered by Article Publisher PRO" -Vulnerability

# Dorks #
dorks [
'"powered by Article Publisher PRO" -Vulnerability'
]



# Matches #
matches [

# Admin page
{ :text=>'<script>location.replace("./admin.php?showlogin");</script>' },
{ :text=>'<title>Article Publisher PRO Administrator Control Panel</title>' },
{ :text=>'<img src="/images/logo_app.gif"></div></td><td width="60%"><div id="title" class="column">Admin Control Panel</div></td>' },
{ :text=>'		<form name=fl method=post action=admin.php?login>' },

# Error page
{ :text=>'<br><br><center><b>Please use a proper method to browse article(s) - The method you are using is not allowed...</b></center>' },

# Version detection # Powered by text
{ :version=>/<div class="powered">Powered by <a href="http:\/\/www.ArticlePublisherPRO.com" target="_blank">Article Publisher PRO<\/a>  v([\d\.]+)/ },

]

end

