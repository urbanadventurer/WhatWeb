##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SmartThumbs" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "SmartThumbs is a complete tgp script (thumbnail gallery post management script), it makes your work easier and faster by automating gallery preview and thumbnail cropping. Productivity based thumbnail rotation makes your productivity higher and brings fast traffic growth."
website "http://www.smart-scripts.com/?action=smartthumbs"

# Google results as at 2011-03-17 #
# 211 for "powered by SMART THUMBS"



# Matches #
matches [

# Powered by link
{ :regexp=>/POWERED[\s]+BY[\s]+<a href="http:\/\/www.smart-scripts.com">SMART THUMBS<\/a>/ },

{ :text=>'POWERED BY<span> <a href="http://www.thumbsrotator.com"><b><span style="font-size: 11px; font-family: Verdana, Arial;">SMART THUMBS</span>' },

]

end


