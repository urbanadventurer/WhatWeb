##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetWin-Surgemail" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "SurgeMail is the fastest, most robust and secure, full-featured email server on the market today supporting all the protocols and standards. Over 10,000 servers installed, serving millions of email accounts world wide. - homepage: http://netwinsite.com/"

# 91 results for intitle:"Surgemail Welcome Page" @ 2010-10-12
examples %w|
casey.umd.edu
casey.umd.edu/scripts/webmail.exe
casey.umd.edu/cgi/user.cgi
186microtec.com
186microtec.com/scripts/webmail.exe
186microtec.com/cgi/user.cgi
www.escape.com:7080
www.escape.com:7080/scripts/webmail.exe
www.escape.com:7080/cgi/user.cgi
Jmail.umd.edu
Jmail.umd.edu/scripts/webmail.exe
Jmail.umd.edu/cgi/user.cgi
mail.durant.k12.ia.us
mail.durant.k12.ia.us/scripts/webmail.exe
mail.durant.k12.ia.us/cgi/user.cgi
mail.inam.gov.mz
mail.inam.gov.mz/scripts/webmail.exe
mail.inam.gov.mz/cgi/user.cgi
mail.planetc.com
mail.planetc.com/scripts/webmail.exe
mail.planetc.com/cgi/user.cgi
po-1.northeast.k12.ia.us
po-1.northeast.k12.ia.us/scripts/webmail.exe
po-1.northeast.k12.ia.us/cgi/user.cgi
solaci.org
solaci.org/scripts/webmail.exe
solaci.org/cgi/user.cgi
webmail.harveylibrary.org
webmail.harveylibrary.org/scripts/webmail.exe
webmail.harveylibrary.org/cgi/user.cgi
webmail.laphamassoc.com
webmail.laphamassoc.com/scripts/webmail.exe
webmail.laphamassoc.com/cgi/user.cgi
www.escape.com:7080
www.escape.com:7080/scripts/webmail.exe
www.hdm01.com
www.hdm01.com/scripts/webmail.exe
www.hdm01.com/cgi/user.cgi
www.tnq.net
www.tnq.net/scripts/webmail.exe
www.tnq.net/cgi/user.cgi
|

matches [

# Webmail Portal # Default HTML comment
{ :text=>'<!-- Start of index.htm --><!-- delayed after doctype-->' },

# Webmail Portal # Default title
{ :text=>'<title>SurgeMail Welcome Page</title>' },

# Webmail Portal # Default meta generator
{ :text=>'<meta name="GENERATOR" content="Mozilla/4.75 [en] (Windows NT 5.0; U) [Netscape]">' },

# Webmail portal # Default link
{ :text=>'/surgeweb" target="client"><input type="button" name="" value="Secure WebMail 2.0 Login" onmouseover="MO(event)" onmouseout="MU(event)" onclick="MC3(event)" class=spbutton></a></td>' },

# Webmail portal # Default link
{ :text=>'<a href="/cgi/user.cgi">User account self management</a> - <font class="small_font">users and domain administrators can modify passwords, forwarding, create new accounts</font></blockquote>' },

# /cgi/user.cgi # About text
{ :text=>'<td colspan="2" class="about_wrapper"><img src="/web/redline.gif"><br><a class="about_link" href="/about_mail.htm">about SurgeMail</a></td>' },

# /cgi/user.cgi # HTML comment
{ :text=>'<!-- Start of na_login.htm --><!-- delayed after doctype-->' },
{ :text=>'<!--<body bgcolor="#FFFFFF" onload="window.focus();document.main.username.focus();">-->' },

# /scripts/webmail.exe # About text
{ :text=>'<a class="about_mail" target="_top" href="/about_mail.htm">about SurgeMail </a></font> </td>' },

# /scripts/webmail.exe # Form HTML
{ :text=>'<form action="/scripts/webmail.exe" method="post" name="reloginform">' },

# Version detection # /scripts/webmail.exe # Copyright text
{ :version=>/<a target="_top" href="http:\/\/netwinsite.com\/ref.htm"> WebMail v([^\ ]+) Copyright &copy; <i>NetWin Ltd<\/i>/ },

]

end

