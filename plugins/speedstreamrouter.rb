##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2
# removed :certainty=>100
##
Plugin.define "SiemensSpeedStreamRouter" do
author "Andrew Horton"
version "0.2"
description "Siemens SpeedStream 4200 and 6520 modems are only sold in Australia through selected internet providers, which include them in their internet access packs. - More Info: http://bc.whirlpool.net.au/bc/hardware/?action=h_view&model_id=279"

# Matches #
matches [

# Title
{:text=>'<TITLE>SpeedStream Router Management Interface</TITLE>'},

# HTML Comment # Copyright
{:certainty=>50, :regexp=>/<!-- Copyright(C) [0-9]+ Siemens Subscriber Networks -->/},

# pflogin.htm Frame
{:certainty=>75, :text=>'<FRAME SRC="pflogin.htm" NAME="rightFrame"'}

]

end

# identifying strings
# <TITLE>SpeedStream Router Management Interface</TITLE>
# <!-- Copyright(C) 2003 Siemens Subscriber Networks -->
# <FRAME SRC="pflogin.htm" NAME="rightFrame"


