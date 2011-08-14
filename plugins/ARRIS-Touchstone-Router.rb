##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ARRIS-Touchstone-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-14
version "0.1"
description "ARRIS Touchstone router - Homepage: http://www.arrisi.com/products/touchstone/"

# Google results as at 2011-08-14 #
# 101 for "HW/FW Versions" "CM Hardware Information" inurl:vers.htm

# Dorks #
dorks [
'"HW/FW Versions" "CM Hardware Information" inurl:vers.htm'
]

# Examples #
examples %w|
76.137.147.106
207.253.164.118
www.derrickhackman.com
www.conceptzowie.com
host-24-100-45-135.newwavecomm.net
anketa.ris.org
midmichigansprayfoam.com
24.198.158.173
www.docrxut.com
|

# Matches #
matches [

# /logo_t.gif
{ :url=>'/logo_t.gif', :md5=>"634c757842b122c6cd4458051ab0ed12" },

# Copyright footer
{ :regexp=>/<br><center>&#169 Copyright 2004-20[\d]{2}, ARRIS Group, Inc\., All rights reserved\.<\/center><\/BODY><\/HTML>/ },

# Frameset
{ :text=>'<FRAME name="tabs" src="/menu.htm?3" frameborder="0" scrolling="no">' },

# Firmware Version Detection # /vers.htm
{ :url=>"/vers.htm", :version=>/<BR> SW_REV: ([^\s^<]+)<BR> MODEL: ([^\s^<]+)  <\/TD><\/TR><tr vAlign=top><td width="170">Product Type:<\/td>/ },

# Model Detection # /vers.htm
{ :url=>"/vers.htm", :model=>/<BR> SW_REV: ([^\s^<]+)<BR> MODEL: ([^\s^<]+)  <\/TD><\/TR><tr vAlign=top><td width="170">Product Type:<\/td>/, :offset=>1 },

]

end

