##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebEye-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.1"
description "WebEye network camera web frontend - homepage: http://www.webgateinc.com/"

# 29 results for +intitle:"Java Applet Page" +inurl:wg_jwebeye +ext:ml @ 2010-07-18
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1351
examples %w|
67.101.238.107/wg_jwebeye.ml
211.172.30.125:82/wg_jwebeye.ml
59.13.193.131:85/wg_jwebeye.ml
210.113.178.252:83/wg_jwebeye.ml
220.72.32.35/wg_jwebeye.ml
119.195.207.171:82/wg_jwebeye.ml
211.221.85.8/wg_jwebeye.ml
124.254.234.117:3899/wg_jwebeye.ml
www.melo-works7.com/wg_jwebeye.ml
alhol.dyndns.tv:8180/wg_jwebeye.ml
www.melo-works1.com/wg_jwebeye.ml
118.47.182.12:83/wg_jwebeye.ml
220.77.167.56/wg_jwebeye.ml
222.119.4.163/wg_jwebeye.ml
119.194.79.103/wg_jwebeye.ml
211.223.97.229/wg_jwebeye.ml
118.44.178.237:83/wg_jwebeye.ml
203.251.86.76/wg_jwebeye.ml
121.136.134.25:2052/wg_jwebeye.ml
220.76.235.20/wg_jwebeye.ml
221.152.0.241:81/wg_jwebeye.ml
211.245.203.51:81/wg_jwebeye.ml
219.117.222.243/wg_jwebeye.ml
200.68.30.74/wg_jwebeye.ml
121.177.117.251/wg_jwebeye.ml
221.165.226.19/wg_jwebeye.ml
webcam10.uoct.cl/wg_jwebeye.ml
219.101.10.252/wg_jwebeye.ml
220.232.212.229/wg_jwebeye.ml
218.101.182.135:7897/wg_jwebeye.ml
|

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

