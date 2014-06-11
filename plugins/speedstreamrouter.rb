##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-05-30 # Brendan Coles <bcoles@gmail.com> #
# Added model detection
# Added google dorks
# Added MAC address detection
##
# Version 0.2
# removed :certainty=>100
##
Plugin.define "Siemens-SpeedStream-Router" do
author "Andrew Horton"
version "0.3"
description "Siemens SpeedStream 4200 and 6520 modems are only sold in Australia through selected internet providers, which include them in their internet access packs. - More Info: http://bc.whirlpool.net.au/bc/hardware/?action=h_view&model_id=279"

# Google results as at 2011-05-30 #
# 369 for intitle:"SpeedStream Router Management Interface"
# 297 for intitle:"SpeedStream Router Management Interface" inurl:title.htm

# Dorks #
dorks [
'intitle:"SpeedStream Router Management Interface" inurl:title.htm'
]



# Matches #
matches [

# Title
{:text=>'<TITLE>SpeedStream Router Management Interface</TITLE>'},

# HTML Comment # Copyright
{:certainty=>50, :regexp=>/<!-- Copyright(C) [0-9]+ Siemens Subscriber Networks -->/},

# pflogin.htm Frame
{:certainty=>75, :text=>'<FRAME SRC="pflogin.htm" NAME="rightFrame"'},

# Model Detection # /summary.htm
{ :url=>"/summary.htm", :model=>/<B>System Type:<\/B><\/TD><TD>SpeedStream ([^\-]+-Series)<\/TD>/ },

# MAC Address Detection # /summary.htm
{ :url=>"/summary.htm", :string=>/<TD ALIGN="right" WIDTH="150"><B>MAC Address:<\/B><\/TD><TD>([\dA-F]{2}:[\dA-F]{2}:[\dA-F]{2}:[\dA-F]{2}:[\dA-F]{2}:[\dA-F]{2})<\/TD><\/TR><\/TABLE>/ },

]

end

