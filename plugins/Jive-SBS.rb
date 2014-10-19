##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Jive-SBS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-21
version "0.1"
description "The Jive Engage platform apparently combines the most powerful features of community software, collaboration software, social networking software & social media monitoring into the leading Social Business Software (SBS) solution."
website "http://www.jivesoftware.com/products"

# Default Login #
# admin:admin
# Old versions of Jive stored the password in plain-text
# Now hashed passwords are located in table "jiveUser" column "passwordHash"

# Default Database Details #
# DBA: postgres
# Database: sbs
# Username: sbs
# Password is located in: /usr/local/jive/etc/postgres/.cs-password
# To enable remote connections to the database, run the script: /usr/local/jive/bin/dbremote, then restart the application with ./appstop && appstart

# Jive-Managed Application Networking #
# The default Jive SBS application will work on the following ports:
# Application server management 	TCP 	127.0.0.1:9000
# HTTP 	TCP 	127.0.0.1:9001
# AJP 	TCP 	127.0.0.1:9002
# Multicast Cluster 	UDP/Multicast 	224.224.224.224:9003
# Note that managed applications should not be accessed directly via the HTTP 9001 port and it is recommended that a firewall prevent access to that port. Its existence is for troubleshooting and support purposes only and is not intended for production use.

# ShodanHQ results as at 2011-08-21 #
# 792 for jive.server.info
# 667 for x-jsl x-jal

# Google results as at 2011-08-21 #
# 906 for site:hosted.jivesoftware.com -thread -message
# 145 for inurl:"/forgot-username!input.jspa" intitle:"Forgot Username"
#  84 for "powered by Jive SBS * community software"
#   3 for intitle:"Jive SBS Administration Console" inurl:"/admin/login.jsp"

# Dorks #
dorks [
'inurl:"/forgot-username!input.jspa" intitle:"Forgot Username"',
'"powered by Jive SBS * community software"'
]



# Matches #
matches [

# Login page # Version Detection # Stylesheets
{ :version=>/<link rel="stylesheet" href="\/([\d\.]+)\/styles\/jive-global\.css" type="text\/css" media="all" \/>/ },
{ :version=>/<link rel="stylesheet" href="\/([\d\.]+)\/styles\/jive-icons\.css" type="text\/css" media="all" \/>/ },

# Login page # Skip navigation link
{ :text=>'<a href="#jive-body-full" class="jive-skip-nav">Skip navigation</a>' },

# Login page # body tag
{ :text=>'<body class="jive-body-formpage jive-body-formpage-login" >' },

# Login page # Version Detection # Powered by footer
{ :version=>/<a class="font-color-meta" href="http:\/\/www\.jivesoftware\.com\/poweredby\/" target="_blank" alt="Jive Software Version: [\d]+">[^<]+powered by Jive SBS &reg; ([^\s]+)  community software[\s]+<\/a>[\s]+<div class="jiveVersion" style="display: none;">/ },

# Login page # Plugin Detection
{ :module=>/jive\.rte\.defaultStyles\.push\("\/plugins\/([^\/]+)\/resources\/styles\/[^\.]+\.css"\);/ },

# Version Detection # Admin Page
# /community/admin/login.jsp?url=main.jsp OR /admin/login.jsp?url=main.jsp
{ :version=>/<div id="jive-loginVersion">[\s]+Jive SBS[\s]+([^\s]+)[\s]+<\/div>/ },

# /community/admin/images/jive-logo.png OR /admin/images/jive-logo.png
{ :url=>"/community/admin/images/jive-logo.png", :md5=>"8badf8cdaaa8e9adf2e552bc3ab77f49" },
{ :url=>"/admin/images/jive-logo.png", :md5=>"8badf8cdaaa8e9adf2e552bc3ab77f49" },

# /___sbsstatic___/logo-jive-darkgloss.jpg
{ :url=>"/___sbsstatic___/logo-jive-darkgloss.jpg", :md5=>"70c76564f1c22c6d9a66854fdc721fd9" },

# /0.0.0/styles/jive-global.css # where each "0" is any integer
{ :text=>" * This software is the proprietary information of Jive Software. Use is subject to license terms.", :url=>"/0.0.0/styles/jive-global.css" },

# jive.server.info Cookie
{ :search=>"headers[set-cookie]", :string=>/jive\.server\.info="?serverName=[^:]+:serverPort=[\d]+:contextPath=[^:]*:(localName=[^:]+:localPort=[\d]+):localAddr=/ },

# X-JSL Header
{ :search=>"headers[x-jsl]", :regexp=>/^D=[\d]+ t=[\d]+$/ },

# X-JAL Header
{ :search=>"headers[x-jal]", :regexp=>/^[\d]+$/ },

]

end

