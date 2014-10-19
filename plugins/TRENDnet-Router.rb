##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TRENDnet-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-18
version "0.1"
description "TRENDnet router"
website "http://www.trendnet.com/"



# Matches #
matches [

# StyleSheet
{ :text=>'<link rel="stylesheet" rev="stylesheet" href="ubicom_style.css" type="text/css" />' },

# Version Detection # Malformed HTML
{ :version=>/<META HTTP-EQUIV="Content-Type"CONTET="text\/html; cahrset=ks_c_5601-1987">[\s]+<TITLE>Web Client [^<]+ v([^\s^<]+)<\/TITLE>/ },

# Model Detection # Title
{ :model=>/<title>TRENDnet ([^\|]+) \|[\s]+Login[\s]+<\/title>/ },

]

end

