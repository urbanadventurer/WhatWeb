##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Asterisk" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-29
version "0.1"
description "Asterisk - communications server software. Asterisk powers IP PBXs, VoIP gateways, call center ACDs and IVR systems."
website "https://www.asterisk.org/asterisk"

# ShodanHQ results as at 2011-08-29 #
# 23,957 for Asterisk

# Google results as at 2011-08-29 #
# 4 for intitle:"Asterisk Configuration GUI" "Asterisk Configuration Panel - Please click on a panel to manage related features"

# Dorks #
dorks [
'intitle:"Asterisk Configuration GUI" "Asterisk Configuration Panel - Please click on a panel to manage related features"'
]



# Matches #
matches [

# Redirect Page # /static/index.html
{ :url=>"/static/index.html", :regexp=>/Your browser should automatically go to the configuration page\.[\s]+<br>[\s]+Or you can <a href="config\/cfgbasic\.html">click here<\/a>[\s]+<br>/ },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Asterisk\// },

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Asterisk\/(.+)$/ },

# HTML Comment
{ :regexp=>/<!--[\s]+\* Asterisk-GUI -[\s]+an Asterisk configuration interface/ },

# StyleSheet
{ :text=>'<link href="stylesheets/cfgbasic.css" media="all" rel="Stylesheet" type="text/css" />' },

# NoScript # /static/config/index.html
{ :url=>"/static/config/index.html", :text=>'<div id="ACTIVE_CONTENT"><noscript>You need to enable Javascript in your browser !!</noscript></div>' },

# GUI Version Detection # /static/config/js/astman.js
{ :url=>"/static/config/js/astman.js", :module=>/		version : '([^']+)' \/\/ gui version/ },

]

end

