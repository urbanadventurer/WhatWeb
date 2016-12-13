##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CouchPotato" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-09
version "0.1"
description "CouchPotato is an automatic NZB and torrent downloader"
website "http://couchpotatoapp.com/"

# Google results as at 2012-01-09 #
# 38 for "Update (diff) available: update now , Check for new version"

# Dorks #
dorks [
'"Update (diff) available: update now , Check for new version"'
]



# Matches #
matches [

# html
{ :text=>'<html><body><h1>Error 401 Unauthorized</h1>Something unexpected has happened.</body></html>', :certainty=>25 },

# Footer # Version Detection
{ :version=>/<a href="\/cron\/force\/">Force check<\/a> \)[\s]+<\/div>[\s]+<div id="version">[\s]+Version: <em>([^\s^<]+)<\/em>/ },

# Default Favicon
{ :md5=>"a59c6fead5d55050674f327955df3acb", :url=>"/static/images/favicon.ico" },

# Default Apple Touch Icon
{ :md5=>"4814f0d48b2944e48d474325fc4a0f86", :url=>"/static/images/homescreen.png" },

]

end

