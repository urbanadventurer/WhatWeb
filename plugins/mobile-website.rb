##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mobile-Website" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-27
version "0.1"
description "This plugin detects websites designed for mobile devices."

# About 210,000,000 results for inurl:.mobi @ 2010-08-27
# About 3,840,000 results for inurl:.mobi +filetype:wml @ 2010-08-27
# 245 results for "for your mobile" inurl:m. @ 2010-08-27
examples %w|
devfiles.myopera.com/articles/1551/mq-viewport.html
m.bing.com
m.jackpotcity.com
m.facebook.com
m.yahoo.com
m.google.com
m.myspace.com
m.zibili.com
rmit.com/mobile
m-ania.tumblr.com
m.urtube.tv
m.zdnet.com
m.mippin.com
m.getjar.com
m.zedge.net
m.mobiletopless.mobi
fiomak.wapka.mobi
sanctus.wapka.mobi
sanctus.wapka.mobi
metro.wapka.mobi
zabavniportalcroatia.wapka.mobi
netindia.wapka.mobi
gettricks.wapka.mobi
guwahatifrenzo.wapka.mobi
fixedprice.mobi
tendi.wapka.mobi
heartblocker.wapka.mobi
sexfor.mobi
salilwallpaper786.wapka.mobi
carsguide.mobi
sbet.mobi
myoz.mobi
more-info.mobi
frontfoot.mobi
mobile.netbank.com.au/iPhone.html
|

matches [

# Doctype
{ :regexp=>/<!DOCTYPE [wml|html]+ PUBLIC "-\/\/WAPFORUM\/\/DTD [XHTML\ Mobile|WML]+ 1.[0-9]{1}\/\/[A-Z]+"/i },

# Meta tags
{ :regexp=>/<meta[^name]+name=[\"]*MobileOptimized[\"]*[^>]+>/i },
{ :regexp=>/<meta[^name]+name=[\"]*HandheldFriendly[\"]*[^>]+>/i },

# Apple handheld
{ :text=>'<meta name="apple-mobile-web-app-capable" content="yes" />', :version=>"Apple Handheld" },

# Apple iPhone
{ :text=>'<link rel="apple-touch-icon"', :version=>"Apple iPhone" },

# Mobile Safari
{ :regexp=>/<meta[^name]+name[\s]*=[\s]*[\"|\']*viewport[\"|\']*[^>]+>/i, :version=>"Mobile Safari" },

# CSS
{ :regexp=>/<style[\s]+type[\s]*=[\s]*text\/css[\s]+media[\s]*=[\s]*[\"|\']*[^>]+>/i },
{ :regexp=>/<link[\s]+rel[\s]*=[\s]*[\"|\']*stylesheet[\"|\']*[\s]+media[\s]*=[\s]*[\"|\']*screen/i },

]

end

