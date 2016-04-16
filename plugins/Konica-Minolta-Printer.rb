##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Konica-Minolta-Printer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-22
version "0.1"
description "Konica Minolta Printer"
website "http://konicaminolta.com/"

# ShodanHQ results as at 2011-09-22 #
# 819 for LPC Http Server



# Matches #
matches [

# also used by Canon
{ :certainty=>25, :search=>"headers[server]", :version=>/^LPC Http Server\/V([^\s]+)/ },

# Model Detection # Title
{ :model=>/<head><meta http-equiv=content-type content=text\/html; charset=[^\s^>]+><TITLE>KONICA MINOLTA .+ ([^<^\s]+)<\/TITLE>/ },

# /wcd/js_error.xml
{ :url=>"/wcd/js_error.xml", :text=>'<?xml-stylesheet href="js_error.xsl" type="text/xsl"?>' },

# Redirect page
{ :text=>'<meta http-equiv="refresh" content="0; URL=/wcd/js_error.xml">' },

# /wcd/system.xml
# requires HTTP referer
#{ :url=>"/wcd/system.xml", :version=>/<\/Name><Version>([^<^\s]+)<\/Version>/ },

# /wcd/system.xml
# requires HTTP referer
#{ :url=>"/wcd/system.xml", :model=>/<System><ProductName>([^<]+)<\/ProductName><ProductID>/ },

]

end

