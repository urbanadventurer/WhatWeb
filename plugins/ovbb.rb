##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OvBB" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-26
version "0.2"
description "Written in PHP and powered by MySQL, OvBB is a light-weight and fast discussion board system that mimics vBulletin 2 in both look and behavior while incorporating new features and functionality."
website "http://sourceforge.net/projects/ovbb/"

# Google results for 2010-09-26 #
# 34 for "powered by OvBB"

# Dorks #
dorks [
'"powered by OvBB"'
]



# Matches #
matches [

# Default title
{ :regexp=>/<title>[^:]+:: Powered by OvBB<\/title>/ },

# Default logo HTML
{ :regexp=>/<img src="images\/ovbb.png" align="middle" border="0" alt="[^:]+:: Powered by OvBB" \/><\/a>/ },

# Default favicon
{ :md5=>"8dd1c74458a43d658a9136333893a999", :url=>"/favicon.ico" },

# Database error page
{ :text=>'<p>Please try again by pressing the <a href="javascript:window.location=window.location;">refresh</a> button in your browser. An e-mail message has been dispatched to the <a href="mailto:' },

# Version Detection
{ :version=>/<a style="color: #EEEEFF;" href="http:\/\/www.ovbb.org">Powered by OvBB V([\d\.a-z]+)<\/a><br \/><br \/>/ },

]

end

