##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Alt-N-MDaemon-WorldClient" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-13
version "0.1"
description "MDaemon Messaging Server, mail server software, supports IMAP, SMTP, and POP3 protocols. MDaemon Messaging Server's webmail client, WorldClient is provided free with every version of MDaemon Messaging Server."
website "http://www.altn.com/Products/MDaemon-Email-Server-Windows/WorldClient-WebMail-MDaemon/"

# ShodanHQ results as at 2011-08-13 #
# 5,053 for WDaemon

# Google results as at 2011-08-13 #
# 267 for inurl:WorldClient.dll?View=Main

# Dorks #
dorks [
'inurl:WorldClient.dll?View=Main'
]



# Matches #
matches [

# Logo HTML
{ :text=>'<div id="biglogo" align="center"><img src="LookOut/biglogo.gif" alt="WorldClient" /></div>' },

# Form HTML
{ :text=>'<form action="/WorldClient.dll?View=Main" target="_top" method="post" onsubmit="document.getElementById(\'Logon\').disabled=true;">' },
{ :text=>'<form action="/WorldClient.dll?View=Main" target="_top" method="post">' },

# Version Detection # Footer
{ :version=>/<strong>[\s]*MDaemon\/WorldClient v([^\s<]+) &copy; 20[\d]{2} Alt-N Technologies\.[\s]*<\/strong>/ },
{ :version=>/<strong><a href="http:\/\/www\.altn\.com\/Products\/MDaemon-Email-Server-Windows\/">MDaemon Messaging Server, BlackBerry Edition<\/a>\/WorldClient v([^\s<]+) &copy; 20[\d]{2} <a href="http:\/\/www\.altn\.com">Alt-N Technologies<\/a>\.<\/strong>/, :string=>"BlackBerry Edition" },

# Version Detection # Server Header
{ :version=>/^WDaemon\/([\d\.]+)$/, :search=>"headers[server]" },

]

end

