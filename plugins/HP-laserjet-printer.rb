##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-19 #
# Updated model detection
##
Plugin.define "HP-LaserJet-Printer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.2"
description "HP LaserJet printer web interface"
website "http://www.hp.com/"

# 109 Google results for inurl:hp/device/this.LCDispatcher @ 2010-07-22

# ShodanHQ results #
# 21,276 for Server:HP-ChaiSOE ONNECTION @ 2010-07-22
# 17,235 for Server ChaiServer @ 2011-02-19

# Dorks #
dorks [
'inurl:hp/device/this.LCDispatcher'
]



# Matches #
matches [

# Default logo HTML
{ :text=>'<img src="images/logo.gif" alt="Click this Hewlett-Packard logo to open a new browser window, which takes you to the external HP.com Web site." /></a>' },

# Default Navigation HTML
{ :text=>'<a href="#skipnavigation" title="Jump to main content. Please activate this if you would like to skip the navigation and jump directly to the main content."></a><a href="http://www.hp.com" onclick="target = new Date().valueOf().toString(); if (window.open) window.open(\'http://www.hp.com\',target,\'resizable=yes,scrollbars=yes,menubar=yes,location=yes,toolbar=yes,status=yes\'); return false;" title="Go to HP corporate web site: external link">' },

{ :text=>'HP 9250C Digital Sender Series</title>', :model=>"9250C Digital Sender" },

{ :text=>'hp 9200C Digital Sender</title>', :model=>"9200C Digital Sender" },

# Model Detection
{ :model=>/<title>[\r\n]*(HP|hp) LaserJet ([^<]+)<\/title>/, :offset=>1 },

# Model Detection # Color
{ :model=>/<title>[\r\n]*(HP|hp) Color LaserJet ([^<]+)<\/title>/i, :offset=>1, :module=>"color" },

]

# Passive #
def passive
        m=[]

	# Server: HP-ChaiServer
	m << { :version=>@headers['server'].scan(/HP-ChaiServer\/([\d\.]+)/) } if @headers['server'] =~ /HP-ChaiServer\/([\d\.]+)/

	# Server: HP-ChaiSOE
	m << { :version=>@headers['server'].scan(/HP-ChaiSOE\/([\d\.]+)/) } if @headers['server'] =~ /HP-ChaiSOE\/([\d\.]+)/

	# Location: hp/device/this.LCDispatcher
	m << { :name=>"HTTP Location Header" } if @headers['location'] =~ /hp\/device\/this.LCDispatcher/

	# Return passive matches
        m

end


end

