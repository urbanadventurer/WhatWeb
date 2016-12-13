##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetWin-Surgemail" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "SurgeMail is the fastest, most robust and secure, full-featured email server on the market today supporting all the protocols and standards. Over 10,000 servers installed, serving millions of email accounts world wide."
website "http://netwinsite.com/"

# 91 results for intitle:"Surgemail Welcome Page" @ 2010-10-12

# Dorks #
dorks [
'intitle:"Surgemail Welcome Page"'
]



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

