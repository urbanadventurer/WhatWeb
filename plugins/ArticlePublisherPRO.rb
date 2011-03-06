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
description "The Flexible and Easy Article Publishing System - homepage: http://article-publisher-pro.phparticlescript.com/"

# 31 results for "powered by Article Publisher PRO" -Vulnerability @ 2010-08-30

# Examples #
examples %w|
article-publisher-pro.phparticlescript.com
article-publisher-pro.phparticlescript.com/admin/admin.php
adultarticlezone.com
coronanewsplace.com
info-knowledge.com
phpscriptstore.com
toddcue.co.uk/articles/
tiredemployees.com
www.articlehealthandfitness.com
www.hauntedbook.co.uk
www.kylecfrazier.com/pennyarticle/
www.medicaidarticles.com
www.submitarticlesfree.com
www.tucanatech.com
www.valuedarticles.com/article/
|

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

