##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zomplog" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "Blog - homepage: http://www.zomp.nl/zomplog/index.php"

# 72 results for "powered by Zomplog" -Vulnerability -exploit @ 2010-09-18
examples %w|
annegret.intensiverleben.at/blogme/
annegret.intensiverleben.at/blogme/login.php
demo.opensourcecms.com/zomplog/index.php
demo.opensourcecms.com/zomplog/login.php
kat.griesstopf.de
kat.griesstopf.de/login.php
wilkie.rcxp.ca/msp23/
wilkie.rcxp.ca/msp23/login.php
www.ajetotechniek.nl/cms/
www.ajetotechniek.nl/cms/login.php
www.catherinefreemanfoundation.com/blog/
www.catherinefreemanfoundation.com/blog/login.php
www.oregonbodybuilding.com/blog/index.php
www.oregonbodybuilding.com/blog/login.php
|

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

