##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LuCI" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.1"
description "LuCI was founded in March 2008 as 'FFLuCI' as part of the efforts to create a port of the Freifunk-Firmware from OpenWrt Whiterussian to Kamikaze"
website "http://luci.subsignal.org/"

# Google results as at 2011-03-07 #
# 70 for "Powered by LuCI" inurl:"/cgi-bin/luci/"

# Dorks #
dorks [
'"Powered by LuCI" inurl:"/cgi-bin/luci/"'
]



# Matches #
matches [

# Redirect Page
{ :text=>'<a style="color: white; text-decoration: none" href="/cgi-bin/luci">LuCI - Lua Configuration Interface</a>' },

# StyleSheet HTML
{ :text=>'<link rel="stylesheet" type="text/css" media="screen" href="/luci-static/openwrt.org/cascade.css" />' },

# Admin Link
{ :text=>'<li><a href="/cgi-bin/luci/admin/">Administration</a></li>' },

# Default Logo
{ :url=>"/luci-static/openwrt.org/header.png", :md5=>"aba24739c2534a161fab2485e605a960" },

# Version Detection # Powered by footer
{ :version=>/<p class="luci"><a href="\/cgi-bin\/luci\/about">Powered by LuCI [^<]+ \(v([^\)]+)\)<\/a><\/p>/, :offset=>0 },

{ :version=>/<p class="luci"><a href="\/cgi-bin\/luci\/about">Powered by LuCI ([\d\.]+)<\/a><\/p>/ },

# Firmware Version Detection
{ :firmware=>/<div id="header">[\r\n]*<h1>OpenWrt Firmware<\/h1>[\r\n]*<p>[\r\n]*([^<]+)<br \/>[\r\n]*Load: [^<]{10,15}<br \/>[\r\n]*Hostname: ([^\r^\n^<]+)[\s\r\n]*<\/p>[\r\n]*<\/div>/, :offset=>0 },

# Hostname Detection
{ :string=>/<div id="header">[\r\n]*<h1>OpenWrt Firmware<\/h1>[\r\n]*<p>[\r\n]*([^<]+)<br \/>[\r\n]*Load: [^<]{10,15}<br \/>[\r\n]*Hostname: ([^\r^\n^<]+)[\s\r\n]*<\/p>[\r\n]*<\/div>/, :offset=>1 },

]

end


