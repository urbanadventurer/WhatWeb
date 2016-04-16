##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Mobotix-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.2"
description "MOBOTIX network camera web interface"
website "http://www.mobotix.com/"
# Default login: admin/meinsm

# Google results as at 2010-07-20 #
# 335 for intext:"MOBOTIX M1" | intext:"MOBOTIX M10") intext:"Open Menu" Shift-Reload -intext
# 83 for (intitle:MOBOTIX intitle:PDAS) | (intitle:MOBOTIX intitle:Seiten) | (inurl:/pda/index.html +camera) -intitle
# 42 for inurl:/en/help.cgi "ID=*"



# Matches #
matches [

# Meta Tags
{ :text=>'<meta name="publisher" content="MOBOTIX AG, Germany">' },
{ :text=>'<meta name="copyright" content="MOBOTIX AG, Germany">' },
{ :text=>'<meta name="author" content="Daniel Kabs, MOBOTIX AG, Kaiserslautern, Germany.">' },

# About Footer
{ :regexp=>/<font face="Helvetica,Arial" size="-2">	&copy;2001[\-0-9]{0,5} <a href="\/about.html">MOBOTIX AG<\/a>, Germany  &middot; <a href="http:\/\/www.mobotix.com\/">http:\/\/www.mobotix.com\/<\/a>/ },

# Firmware Detection # Default JavaScript
{ :firmware=>/var filesystem__version="[M0-1\-]*V([\d\.]+)";/ },

]

end

