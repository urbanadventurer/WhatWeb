##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "LocazoList-Classifieds" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.2"
description "Locazolist v2.02b is a text based classifieds ad system based on ASP and Microsoft SQL Server 2005. Locazolist v2 is known as the first and still only ASP based 'craigslist clone script' in the web since its development beginning in late 2005."
website "http://www.locazolist.com/"

# Google results as at 2010-08-14 #
# 24 for "powered by LocazoList" -exploit

# Dorks #
dorks [
'"powered by LocazoList" -exploit'
]



# Matches #
matches [

# Fonts Stylesheet HTML
{ :text=>'<link rel="stylesheet" href="includes/lczFonts.css" type="text/css">' },

# Powered by text
{ :regexp=>/Powered by <a href='http:\/\/www.locazo[a-z]{0,4}.com[\/]?' style='font-size:10px; color:black'>Locazolist<\/a> Copyright &copy; [0-9]{4}<\/font>/ },

# Version Detection # Powered by text
{ :version=>/<br><br><br><br><font face='verdana' size='1'>Powered by LocazoList v([0-9a-z\.]+)<br>Copyright [0-9]{4} <a href='http:\/\/www.locazo.com\/applications'>Locazo.com<\/a><\/font>/ },

# Version Detection # Powered by text
{ :version=>/<title>LocazoList Classifieds v[0-9a-z\.]+ - powered by LocazoList ([0-9a-z\.]+)<\/title>/ },

]

end

