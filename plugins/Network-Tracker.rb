##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Network-Tracker" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-19
version "0.1"
description "Network Tracker is a free web-based network management tool. Network tracker allows you to track all changes and updates made to a network device. - Requires PHP and MySQL"
website "http://networktracker.org/"

# Dorks #
dorks [
'"powered by network tracker"'
]



# Matches #
matches [

# Powered by link
{ :text=>'<p><small>powered by <a href="http://networktracker.org" target="_blank" title="network tracker website">network tracker</a></small></p>' },

]

end

