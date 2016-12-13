##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pligg-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.1"
description "Pligg is an open source CMS (Content Management System) that you can download and use for free."
website "http://www.pligg.com/"

# Google results as at 2010-11-07 #
# 144 results for "powered by Pligg CMS"

# Dorks #
dorks [
'"Powered By Pligg CMS"'
]



# Matches #
matches [

# Powered by link
{ :regexp=>/Powered [Bb]y:? <a href="http:\/\/www.pligg.com\/?"( target="_blank")?>(Powered By )?Pligg( CMS)?<\/a>/ },

# JavaScript # Twitter Feed
{ :text=>"jQuery.jTwitter('pligg', function (userdata) {" },

# Default Favicon
{ :md5=>"7c548077f2a8cc6099858eb1bf9201b4", :url=>"/favicon.ico" },

]

end

