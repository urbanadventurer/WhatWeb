##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Carrier-CCNWeb" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-06
version "0.1"
description 'Carrier CCNWeb - a web-based HVAC front-end for a Carrier CCN Controls system. Comes out of the box with the ability to "Self-Learn" the building controls and then automatically display them."
website "'

# ShodanHQ results as at 2012-03-06 #
# 417 for location login.ssi

# Google results as at 2012-03-06 #
# 1 for intitle:"CCNWeb Login" inurl:"login.ssi"

# Dorks #
dorks [
'intitle:"CCNWeb Login" inurl:"login.ssi"'
]



# Matches #
matches [

# /images/CCNWeb.gif
{ :url=>"/images/CCNWeb.gif", :md5=>"724cba3a2d5b36c754d55ae0e450429a" },

# /login.ssi # Applet
{ :text=>'<APPLET CODE="JLogin.class" ARCHIVE="JLogin.jar" MAYSCRIPT WIDTH=310 HEIGHT=185>' },

]

end

