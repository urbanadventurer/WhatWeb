##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Battle-Blog" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-26
version "0.1"
description "Battle Blog is a Fun Debate and Resolution Tool"
website "http://www.davethewebguy.com/battleblog/"

# 12 results for "Powered by Battle Blog" -"Google dork" @ 2010-08-26
# 4 results inurl:vote.asp vtype=entry grade=promote @ 2010-08-26
# More examples at http://www.davethewebguy.com/battleblog/c_bbdirectory.asp


matches [

# Powered by text
{ :text=>'<br /><br /><font face="arial" size="1">Powered by <a href="http://www.battleblog.com">Battle Blog</a></font>' },

# Admin page
{ :text=>'<title>Battle Blog Login</title> '},
{ :text=>'<form name = "UserInfoCollect" action = "authenticate.asp" method = "post">' },
{ :text=>'<table width = "10%" cellpadding = "5" style = "border-style: solid; border-color: #000000; border-width: 1px;">' },

]

end

