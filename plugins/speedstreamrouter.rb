##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100

Plugin.define "SiemensSpeedStreamRouter" do
author "Andrew Horton"
version "0.2"
# identifying strings
# <TITLE>SpeedStream Router Management Interface</TITLE>
# <!-- Copyright(C) 2003 Siemens Subscriber Networks -->
# <FRAME SRC="pflogin.htm" NAME="rightFrame"

matches [
{:text=>'<TITLE>SpeedStream Router Management Interface</TITLE>'},
{:certainty=>50, :regexp=>/<!-- Copyright(C) [0-9]+ Siemens Subscriber Networks -->/},
{:certainty=>75, :text=>'<FRAME SRC="pflogin.htm" NAME="rightFrame"'}
]


end

