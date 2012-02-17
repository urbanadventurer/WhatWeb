##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "darkstat" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-17
version "0.1"
description "darkstat captures network traffic, calculates statistics about usage, and serves reports over HTTP. - Homepage: http://unix4lyfe.org/darkstat/"

# ShodanHQ results as at 2012-02-17 #
# 11 for darkstat

# Google results as at 2012-02-17 #
# 15 for intitle:darkstat intitle:"graphs" "graphs" "Running for"

# Dorks #
dorks [
'intitle:darkstat intitle:"graphs" "graphs" "Running for"'
]

# Examples #
examples %w|
prototypenl.dyndns.org:666
www.kahl-com.de:666
oldi.homelinux.net:666
live.wuga.org
flatlinebb.raspberry.feralhosting.com:666
elorduy.net:667
www.nutcracker.cz:81
golfetto.dyndns.org:667
geoz.co.nz:8080
noc.7portal.com.ua:667
rt66.ath.cx:667
wi-fi.ceikneu.edu.ua:667
fxmx86.mine.nu:86
|

# Matches #
matches [

# Menu # Version Detection
{ :version=>/<li class="label">darkstat ([^\s^<]+)<\/li><li><a href="[^"]+">graphs<\/a><\/li>/ },

# Title # Version Detection
{ :version=>/<title>darkstat ([^\s]+) : graphs ([^\s^\)]+)<\/title>/ },

# HTTP Server Header # Version Detection
{ :search=>"headers[server]", :version=>/^darkstat\/([^\s]+)$/ },

]

end

