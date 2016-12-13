# coding: ascii-8bit
##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "SnoGrafx" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "Image gallery software"
website "http://snografx.com/"

# 27 results for "powered by SnoGrafx" @ 2010-09-18


matches [

# HTML comment
{ :regexp=>/<!-- Website designed[\ and powered]* by [^\|]+\|\| Visit: http:\/\/snografx.com\/ -->/ },

# Default Javascript
{ :text=>'var snoOff = new Image();snoOff.src = "xfx/snografx0.gif";var snoOn = new Image();snoOn.src = "xfx/snografx2.gif";' },
{ :text=>'var snoOff = new Image();snoOff.src = "4fx/00sno.png";var snoOn = new Image();snoOn.src = "4fx/02sno.png";' },

# Powered by text
{ :text=>"Website powered by: <a href='http://snografx.com/' target='_blank'>Snöfx</a>" },

]

end

