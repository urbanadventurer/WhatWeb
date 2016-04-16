##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ClipShare" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-21
version "0.1"
description "With a huge variety of features and options, at an extremely affordable price, ClipShare is the ultimate video script for starting your highly profitable video sharing community website just like the big boys: Youtube, DailyMotion, Metacafe, or Google Video."
website "http://www.clip-share.com/"

# Google results as at 2010-08-21 #
# 204 for "powered by ClipShare"

# Dorks #
dorks [
'"powered by ClipShare"'
]



matches [

{ :text=>'<!--!!!!!!!!!!!!!!!!!!!!!!!!! Processing SCRIPT !!!!!!!!!!!!!!!!!!!-->' },
{ :text=>'<!--!!!!!!!!!!!!!!!!!!!!!!!! LIBRARY !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->' },
{ :text=>'Powered By <a href="http://www.clip-share.com">ClipShare</a>' },

]


end

