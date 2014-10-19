##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebEye-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.1"
description "WebEye network camera web frontend"
website "http://www.webgateinc.com/"

# 29 results for +intitle:"Java Applet Page" +inurl:wg_jwebeye +ext:ml @ 2010-07-18
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1351


matches [

{ :text=>'<title>WebEye User Login</title>' },
{ :text=>'<title>WebEye Java Applet Page</title>' },
{ :text=>'<title>WebEye Index Page</title>' },
{ :text=>'<meta name="Author" content="WebGateInc">' },
{ :text=>'<meta name="generator" content="WebGateInc">' },
{ :text=>'<p>Click <a href="./login.ml?FORM_METHOD=get">here</a> if you have a problem to login ...' },
{ :text=>'			  <applet archive="/wg_jwebeye.jar" code=WebEyeApplet.class codebase=. width=720 height=773> \\' },

]


end

