##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "i3micro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.2"
description "Tilgin was founded under the name i3 micro technology in 1997 and develops equipment for IPTV and VOIP solutions."
website "http://www.tilgin.com/"

# ShodanHQ results as at 2011-05-30 #
# 5,115 for i3micro -SIP



# Matches #
matches [

# VRG # Default Favicon
{ :model=>'VRG', :url=>"/favicon.ico", :md5=>"e4a509e78afca846cd0e6c0672797de5" },

# Model Detection # WWW-Authenticate: Digest realm i3micro
{ :model=>/^Digest realm="i3micro (V[A-Z]{2})", nonce/, :search=>"headers[www-authenticate]" },

]

end

