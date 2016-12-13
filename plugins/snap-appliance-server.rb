##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
# Version 0.2 # 2011-05-16 #
# Updated regex
# Added version detection
# Added server name detection
##
Plugin.define "Snap-Appliance-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.3"
description "Snap Appliance Server network attached storage (NAS)"
website "http://www.overlandstorage.com/"

# Google results as at 2011-05-16 #
# 92 for inurl:config?Func=AboutSend
# 25 for intitle:"Snap Server" intitle:"Home" "Active Users"

# ShodanHQ results as at 2011-05-16 #
# 476 for Server: Snap Appliance, Inc
# 97 for Quantum Corporation

# Dorks #
dorks [
'intitle:"Snap Server" intitle:"Home" "Active Users"',
'inurl:config?Func=AboutSend'
]



# Matches #
matches [

# Server Name Detection # Default Title
{ :string=>/<TITLE>Snap Server ([^\s]+) \[[^\]]+\]<\/TITLE>/ },

# Server Name Detection # About Page # Default Title
{ :string=>/<HTML><HEAD><TITLE>About Snap Server ([^\s]+)<\/TITLE><\/HEAD>/ },

# Tech support link + image
{ :text=>'<A HREF="http://www.snapappliance.com/support" TARGET="new"><IMG SRC="/config/resource/Tech.gif"  ALIGN="TOP" NATURALSIZEFLAG="3" BORDER="0" ALT=""></A> '},

# JavaScript # _ShowAbout() link
{ :text=>'<A HREF="javascript:_ShowAbout()" onMouseOver="window.status=\'About Snap Server\'; return true;" onMouseOut="window.status=\'\'; return true;"><IMG SRC="/config/resource/About.gif"  ALIGN="TOP" NATURALSIZEFLAG="3" BORDER="0" ALT=""></A>' },

# JavaScript # /config?Func=AboutSend popup
{ :text=>'   window.open("/config?Func=AboutSend","AboutSnap","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,width=500,height=395,resizable=yes,dependent=yes"); '},

# Snap Appliance(s) # HTTP Server Header
{ :regexp=>/^Snap Appliance/, :search=>"headers[server]" },

# Quantum Corporation # HTTP Server Header
{ :regexp=>/^Quantum Corporation/, :search=>"headers[server]" },

# Version Detection # Snap Appliance(s) # HTTP Server Header
{ :version=>/^Snap Appliances?, Inc\.\/([\d\.]+)$/, :search=>"headers[server]" },

# Version Detection # Quantum Corporation # HTTP Server Header
{ :version=>/^Quantum Corporation\.\/([\d\.]+)$/, :search=>"headers[server]" },

]

end

# An aggressive plugin could get the model, software version, firmware version and BIOS version from:
# /config?Func=AboutSend&Frame=Main

