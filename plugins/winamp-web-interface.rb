##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Winamp-Web-Interface" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-02
version "0.2"
description "web interface for winamp mp3 player"
website "http://www.winamp.com/"

# Google results as at 2010-07-02 #
# 5 for "About Winamp Web Interface" intitle:"Winamp Web Interface"



# Matches #
matches [

# GHDB Match
{:ghdb=>'"About Winamp Web Interface" intitle:"Winamp Web Interface"', :certainty=>75 },

# Default noframes HTML
{:text=>'<noframes><p><b>Frames are required for this site!<b></p><p>If no-frames operation is required, check the <b>No Frames Mode</b> box in the Options screen.</p>' },

# Version Detection
{ :version=>/<a href="JavaScript:about\(\)">About Winamp Web Interface v([\.\d]+)<\/a><\/h6><hr>/ },

]

end

