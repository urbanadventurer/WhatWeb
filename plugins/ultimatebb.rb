##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ultimate-Bulletin-Board" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-29
version "0.1"
description "Since 1997, thousands of websites have chosen UBB for their forum software solution. With the integrated Portal and Photo Gallery (UBB.Gallery) you can create your entire website using UBB without the need to buy anything else"
website "http://ubbcentral.com/"

# Google results as at 2011-03-29 #
# 511 for "Powered by UBB.threads"

# Dorks #
dorks [
'"Powered by UBB.threads"'
]



# Matches #
matches [

# GHDB
{ :certainty=>75, :ghdb=>'filetype:cgi inurl:/ultimatebb.cgi' },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="UBB\.threads ([\d\.]+)" \/>/ },

# Version Detection # Powered by footer
{ :version=>/<center>Powered by <a target="_blank" style="TEXT-DECORATION: none; COLOR: #000066; FONT-SIZE: 10px" href="http:\/\/www.php121.com"><U>PHP121<\/U><\/a> v([\d\.]+)<\/center>/ },
{ :version=>/<a href="http:\/\/www.groupee.com\/landing\/goto\.php\?a=ubb\.classic">Powered by UBB.classic&trade;[\s]+([\d\.]+)(<!-- [\d\.]+ -->)?<\/a>/ },

]

end


