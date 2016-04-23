##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EasyFeeds" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-05
version "0.1"
description "EasyFeeds is a powerful PHP based RSS reader and news aggregator."
website "http://www.ktools.net/easyfeeds/"

# 54 for "Partners" "Powered by" +EasyFeeds +"Ktools.net"

# Dorks #
dorks [
'"Partners" "Powered by" "EasyFeeds" "Ktools.net"'
]



# Matches #
matches [

# divs
{ :text=>'<div id="feedslist" align="left" class="divTableCell">' },
{ :text=>'<div style="float: left; height: 35px; width: 300px; margin: 45px 0px 0px 40px;"></div>' },

# Version Detection
{ :version=>/<td colspan="3" style="font-size: 10px; text-align: left;"><CENTER>Powered By:<br>EasyFeeds-([^<]+)<br \/>Ktools.net LLC-<a href="http:\/\/www.ktools.net" target="_blank">http:\/\/www.ktools.net<\/a><\/CENTER><\/td>/ },

# Login Page # Version Detection
{ :version=>/<CENTER>Powered By:<br>EasyFeeds-([^<]+)<br \/>Ktools.net LLC-<a href="http:\/\/www.ktools.net" target="_blank">http:\/\/www.ktools.net<\/a><\/CENTER><\/div>/ },

]

end

