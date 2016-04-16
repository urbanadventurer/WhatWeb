##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "D-Link-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.1"
description "D-Link network camera web interface"
website "http://www.dlink.com/"

# Google results as at 2010-07-22 #
# 1 for inurl:setdo.cgi intext:"Set DO OK"
# 2 for intitle:"DCS" Camera inurl:web inurl:login

# Dorks #
dorks [
'inurl:setdo.cgi intext:"Set DO OK"',
'intitle:"DCS" Camera inurl:web inurl:login'
]



matches [

# DCS-5300
{ :text=>'<title>DCS-5300</title></head>', :version=>"DCS-5300" },

# DCS-950G
{ :text=>'<TITLE>DCS-950G</TITLE>', :version=>"DCS-950G" },
{ :text=>'if (document.domain.toLowerCase() == "DCS-950G".toLowerCase())', :version=>"DCS-950G" },

]


end

