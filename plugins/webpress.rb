##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "WebPress" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.2"
description "WebPress is the foundation on which we build web sites. It.s our unique Content Management System (CMS), flexible enough for us to build your dream site, and easy enough for you to maintain it yourself."
website "http://www.goywp.com/view/cms"

# Google results as at 2010-07-18 #
# 9 for +"powered by WebPress"



# Matches #
matches [

# Powered by text
{ :text=>'Powered By <a href="http://www.ecomenterprises.com" target="_blank" class="small_text">WebPress</a><SUP><FONT SIZE="-5">TM</FONT></SUP></td>' },

{ :text=>'Powered by <a href="http://goywp.com" id="webpresslink">WebPress</a><br></p></td>' },

{ :text=>'Powered by </font><font size="1" color="#000000" face="Arial">YWP</font>' },

# Version Detection # Powered bt HTML comment
{ :version=>/<!-- Powered by YWP ([\d\.]+) -->/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="YWP ([\d\.]+)">/ },

]

end

