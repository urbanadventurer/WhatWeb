##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SmartThumbs" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "SmartThumbs is a complete tgp script (thumbnail gallery post management script), it makes your work easier and faster by automating gallery preview and thumbnail cropping. Productivity based thumbnail rotation makes your productivity higher and brings fast traffic growth. - Homepage: http://www.smart-scripts.com/?action=smartthumbs"

# Google results as at 2011-03-17 #
# 211 for "powered by SMART THUMBS"

# Examples #
examples %w|
www.finethumbs.com
www.kellysthumbs.com
sweetythumbs.com
www.hotwifepornmovies.com
www.gothporntgp.com
www.teenpanties-tgp.com
free-porn-webs.com
www.tgpfootfetish.com
www.gothicporntgp.com
www.wetpantiesex.com
www.sexlesbiantgp.com
top3dsex.com
www.tube777.net
www.ineedbdsm.com
www.mytubeporn.net
www.bondagebigpics.com
www.anusgame.com
porncomicsfree.com
www.bbwpornclub.com
pinkload.com
amazing3dporn.com
www.pinupvixens.com
www.girlpeeing.org:8081
nubianflesh.com
|

# Matches #
matches [

# Powered by link
{ :regexp=>/POWERED[\s]+BY[\s]+<a href="http:\/\/www.smart-scripts.com">SMART THUMBS<\/a>/ },

{ :text=>'POWERED BY<span> <a href="http://www.thumbsrotator.com"><b><span style="font-size: 11px; font-family: Verdana, Arial;">SMART THUMBS</span>' },

]

end


