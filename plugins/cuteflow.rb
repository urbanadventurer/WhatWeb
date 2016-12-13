##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CuteFlow" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-20
version "0.1"
description "CuteFlow - web-based workflow management"
website "http://sourceforge.net/projects/cuteflow/"

# ShodanHQ results as at 2012-06-20 #
# 8 for strMyLanguage

# Google results as at 2012-06-20 #
# 30 for intitle:"CuteFlow" "CuteFlow - Document circulation system" "Login" "Username" "Password" "Language"

# Dorks #
dorks [
'intitle:"CuteFlow" "CuteFlow - Document circulation system" "Login" "Username" "Password" "Language"'
]



# Matches #
matches [

# Powered by footer # Version Detection
{ :version=>/<a href="http:\/\/cuteflow\.org" target="_blank"><img src="images\/cuteflow_logo_small\.png" border="0"\s?\/><\/a><br>\s+<strong style="font-size:8pt;font-weight:normal">Version ([^\s^<]+)<\/strong><br>/ },

# Set-Cookie # strMyLanguage
{ :search=>"headers[set-cookie]", :regexp=>/^strMyLanguage=/ },

]

end

