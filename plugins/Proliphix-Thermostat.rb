##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Proliphix-Thermostat" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-09
version "0.1"
description "Network thermostats specifically designed for Internet access and control. They provide the features and functions of a conventional programmable thermostat with an easy-to-use, browser-based interface that significantly simplifies HVAC programming and control."
website "http://www.proliphix.com/"

# Google results as at 2011-03-09 #
# 26 for intitle:"Thermostat" intitle:"Status & Control"

# Dorks #
dorks [
'intitle:"Thermostat" intitle:"Status & Control"'
]



# Matches #
matches [

# Model Detection
{ :model=>/<script type="text\/javascript">[\r\n]*printStatusHead\(adStat,[\s]*"([^"]{4,5})","[a-z]?"\)[\r\n]*bodyStart\("status.shtml", "settings"\)/ },

# JavaScript Link
{ :text=>"printFSC(\"\", linkbuttonGet('location.href', 'Refresh'), \"<input type=submit name='submit' value='Submit'>\")" },

# Default Title
{ :certainty=>25, :text=>" - Status &amp; Control</title>" },

]

end


