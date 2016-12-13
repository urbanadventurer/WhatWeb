##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Wing-FTP-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-13
version "0.1"
description "Wing FTP server is a secure multi-protocol file server(FTP, HTTP, FTPS, HTTPS, SFTP) for Windows, Linux, Mac OSX and Solaris."
website "http://www.wftpserver.com/"

# Google results as at 2011-08-13 #
# 5 for intitle:"Wing FTP Server Administrator" "The administration interface requires that you have Javascript enabled on your browser."
# 2 for "The web client depend on JavaScript to function properly" intitle:"How do I enable JavaScript in my browser" inurl:help_javascript.htm

# Dorks #
dorks [
'intitle:"Wing FTP Server Administrator" "The administration interface requires that you have Javascript enabled on your browser."',
'"The web client depend on JavaScript to function properly" intitle:"How do I enable JavaScript in my browser" inurl:help_javascript.htm'
]



# Matches #
matches [

# Server Name # Server Header
{ :search=>"headers[server]", :string=>/^Wing FTP Server\/([\d\.]+)\(([^\)]*)\)$/, :offset=>1 },
{ :search=>"headers[server]", :string=>/^Wing FTP Server\(([^\)]*)\)$/ },

# Version Detection # Server Header
{ :search=>"headers[server]", :version=>/^Wing FTP Server\/([\d\.]+)\(([^\)]*)\)$/ },

# /help_javascript.htm
{ :url=>"/help_javascript.htm", :text=>'<p>JavaScript is a scripting language that works with your browser to create interactive elements in web pages. The web client depend on JavaScript to function properly. </p>' },

]

end

