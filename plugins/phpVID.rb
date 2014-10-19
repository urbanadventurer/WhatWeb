##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpVID" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.1"
description "phpVID is a video sharing software or a video shating script and has all the features that are needed to run a successful video sharing website like youtube.com."
website "http://www.vastal.com/phpvid-the-video-sharing-software.html"

# No results for "Powered By phpVID" @ 2010-09-04


# Dorks #
dorks [
'"Powered By phpVID"'
]

# Matches #
matches [

# Powered by text
{ :text=>"<div align=\"center\" class='powered_by_a'>Powered By <a href='http://www.vastal.com/' target='_blank' class='powered_by_a'>" },

]

end

