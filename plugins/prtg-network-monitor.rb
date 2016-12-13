##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "PRTG-Network-Monitor" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.2"
description "PRTG Network Monitor - Availability and Bandwidth Monitoring"
website "http://www.paessler.com/prtg"

# ShodanHQ results as at 2011-05-30 #
# 1,687 for PRTG

# Google results as at 2011-05-30 #
# 36 for "PRTG Network Monitor" intitle:"PRTG Network Monitor" "Password" "Login Name "GUI" inurl:"install_the_windows_gui"

# Dorks
dorks [
'"PRTG Network Monitor" intitle:"PRTG Network Monitor" "Password" "Login Name "GUI" inurl:"install_the_windows_gui"'
]



# Matches #
matches [

# Server Name Detection
{ :string=>/<title>PRTG Network Monitor \(([^\)]+)\)&nbsp;\|&nbsp;Welcome<\/title>/ },

# Version Detection
{ :version=>/<link rel="stylesheet" type="text\/css" href="\/css\/prtgmini\.css\?prtgversion=([^"]+)" media="print,screen,projection" \/>/ },

#  HTTP Server Header
{ :version=>/^PRTG/, :search=>"headers[server]" },

# Version Detection # HTTP Server Header
{ :version=>/^PRTG\/([^\s]+)$/, :search=>"headers[server]" },

]


end

