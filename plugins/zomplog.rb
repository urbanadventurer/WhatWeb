##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zomplog" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "Blog"
website "http://www.zomp.nl/zomplog/index.php"

# 72 results for "powered by Zomplog" -Vulnerability -exploit @ 2010-09-18

# Dorks #
dorks [
'"powered by Zomplog" -Vulnerability -exploit'
]



matches [

# Powered by text
{ :text=>'Powered by <a href="http://zomplog.zomp.nl" target="_blank">Zomplog</a>' },

# Login page # Default title
{ :text=>'<title>Zomplog &rsaquo; Login</title>' },

# Login page # Copyright text
{ :text=>'<td width="135"><div align="right"><span class="style1"><a href="http://www.zomp.nl/zomplog/" target="_blank">zomplog &rsaquo;&rsaquo;</a> </span></div></td>' },

# Meta generator
{ :text=>'<meta name="generator" content="Zomplog" />' },

# Default CSS
{ :text=>'/* Navbar (Zomplog-specific) */' },

]


end

