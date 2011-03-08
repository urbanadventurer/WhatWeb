##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Proliphix-Thermostat" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-09
version "0.1"
description "Network thermostats specifically designed for Internet access and control. They provide the features and functions of a conventional programmable thermostat with an easy-to-use, browser-based interface that significantly simplifies HVAC programming and control. - Homepage: http://www.proliphix.com/"

# Google results as at 2011-03-09 #
# 26 for intitle:"Thermostat" intitle:"Status & Control"

# Examples #
examples %w|
128.174.27.99
lakeandlogs.com
216.17.37.215
peternunes.net:8082
38.107.98.75
96.57.254.211
75.127.241.50:8282
24.189.14.195:8282
66.108.147.235:8282
www.tannerbryant.com
204.14.103.124:81
delta-jam.com
68.162.223.154:8002
68.112.86.194:1027
fieldfresh.net
205.155.167.20
www.poolcontroller.com:1068
kardash.org:81
toybox.viewnetcam.com:6969
octagon.homeip.net:8071
thecabin.thruhere.net:8150
lcgcam5.remotecam.com
96.56.66.155
|

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


