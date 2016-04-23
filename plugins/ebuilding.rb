##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eBuilding-Network-Controller" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-07-28
version "0.1"
description "Teletrol Systems Inc. - eBuilding Network Controller - web interface - facility automation system - More info: http://www.trademarkia.com/ebuilding-webbased-facility-automation-systems-75885297.html"

# ShodanHQ results # 2013-07-28
# 41 for Intrinsyc deviceWEB -PDQ


# Matches #
matches [

# Title
{ :certainty=>75, :text=>'<title>eBuilding Web</title>' },

# /index.html
{ :url=>"/", :md5=>"fcfda4be8f50b3312b38966f2864188f" },

# /center_frame.html # Title
{ :text=>'<HTML><HEAD><TITLE>eBuilding Network Controller</TITLE><LINK title=global_style ' },

]

end

