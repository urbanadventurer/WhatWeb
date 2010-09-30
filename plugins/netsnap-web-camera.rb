##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Netsnap-Web-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-10
version "0.1"
description "Netsnap java client web interface for video cameras"
examples %w|
65.171.3.102:85/coolpush.htm
24.118.32.173:86/coolpush.htm
165.234.186.24:81/coolpush.htm
www.mheer.com:8082/push100.htm
members.fortunecity.com/keepinitreal1/cam2.htm
foxhunter12.tripod.com/webcam/CoolPush.htm
homepage.hispeed.ch/Bertcam/push100.htm
|

matches [

# 18 results for intitle:"Live NetSnap Cam-Server feed" -intitle @ 2010-07-10
# http://www.hackersforcharity.org/ghdb/?function=detail&id=882
{:text=>'<title>Live NetSnap Cam-Server feed</title>' },

{:text=>'color="#008080">Live-Webcam</font></big></big></big></strong></em></font></h3>' },

{:text=>'color="#008080">NetSnap®</font></big></big></big></big><font size="6"> </font></strong></font></em></h3>' },

{:text=>'<p align="center"><font face="Arial"><small><small>NetSnap is a registered Trademark of' },
]


end

