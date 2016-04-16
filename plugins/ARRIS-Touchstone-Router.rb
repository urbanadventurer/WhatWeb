##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-09-14 #
# Updated model/version detection and added server header match.
##
Plugin.define "ARRIS-Touchstone-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-14
version "0.2"
description "ARRIS Touchstone router"
website "http://www.arrisi.com/products/touchstone/"

# ShodanHQ results as at 2011-09-14 #
# 211,058 for NET-DK

# Google results as at 2011-08-14 #
# 101 for "HW/FW Versions" "CM Hardware Information" inurl:vers.htm

# Dorks #
dorks [
'"HW/FW Versions" "CM Hardware Information" inurl:vers.htm'
]



# Matches #
matches [

# HTTP Server Header
{ :certainty=>25, :search=>"headers[server]", :regexp=>/^NET-DK\/[\d\.]+$/ },

# /logo_t.gif
{ :url=>'/logo_t.gif', :md5=>"634c757842b122c6cd4458051ab0ed12" },

# Copyright footer
{ :regexp=>/<br><center>&#169 Copyright (2004-)?20[\d]{2}, ARRIS Group, Inc\., All rights reserved\.<\/center><\/BODY><\/HTML>/ },

# Frameset
{ :text=>'<FRAME name="tabs" src="/menu.htm?3" frameborder="0" scrolling="no">' },

# Software Version Detection # /vers.htm
{ :url=>"/vers.htm", :version=>/<BR> SW_REV: ([^\s^<]+)<BR> MODEL: ([^\s^<]+)  <\/TD><\/TR><tr vAlign=top><td width="170">Product Type:<\/td>/ },

# Software Version Detection # /cgi-bin/vers_cgi
{ :url=>"/cgi-bin/vers_cgi", :version=>/HW_REV: [^<]+<br>[\s]+VENDOR: Arris Interactive, L\.L\.C\.<br>[\s]+BOOTR: [^<]+<br>[\s]+SW_REV: ([^\s^<]+)<br>[\s]+MODEL: ([^\s^<]+)<\/td>/ },

# Firmware Version Detection # /cgi-bin/vers_cgi
{ :url=>"/cgi-bin/vers_cgi", :firmware=>/HW_REV: [^<]+<br>[\s]+VENDOR: Arris Interactive, L\.L\.C\.<br>[\s]+BOOTR: ([^<^\s]+)<br>[\s]+SW_REV: ([^\s^<]+)<br>[\s]+MODEL: ([^\s^<]+)<\/td>/ },

# Model Detection # /cgi-bin/vers_cgi
{ :url=>"/cgi-bin/vers_cgi", :model=>/HW_REV: [^<]+<br>[\s]+VENDOR: Arris Interactive, L\.L\.C\.<br>[\s]+BOOTR: [^<]+<br>[\s]+SW_REV: ([^\s^<]+)<br>[\s]+MODEL: ([^\s^<]+)<\/td>/, :offset=>1 },

# Model Detection # /vers.htm
{ :url=>"/vers.htm", :model=>/<BR> SW_REV: ([^\s^<]+)<BR> MODEL: ([^\s^<]+)  <\/TD><\/TR><tr vAlign=top><td width="170">Product Type:<\/td>/, :offset=>1 },

]

end

