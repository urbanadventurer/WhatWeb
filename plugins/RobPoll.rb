##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RobPoll" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-20
version "0.1"
description "RobPoll - CGI poll system"
website "Offline"
# Default password: robpoll

# Google results as at 2011-04-20 #
# 38 for inurl:robpoll.cgi filetype:cgi

# Dorks #
dorks [
'inurl:robpoll.cgi filetype:cgi'
]



# Matches #
matches [

# GHDB # URL pattern
{ :ghdb=>'inurl:"robpoll.cgi?start" filetype:cgi' },

# Admin Page # Title
{ :text=>'<head><title>RobPoll Admin</title></head>' },

# Default form html
{ :regexp=>/<form action="[^"]*\/robpoll\.cgi" method="post">/ },

]

end


