##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "osTicket" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-24
version "0.1"
description "osTicket is a widely-used open source support ticket system - Requires: PHP and MySQL"
website "http://www.osticket.com/"

# Google results as at 2011-08-24 #
# 511 for "SUPPORT TICKET SYSTEM" +Home "Ticket Status" "New Ticket" "Welcome to the support center"
#  33 for intitle:"osTicket Installer" "osTicket version" "osTicket web path and title"

# Dorks #
dorks [
'"SUPPORT TICKET SYSTEM" "Home" "Ticket Status" "New Ticket" "Welcome to the support center"'
]



# Matches #
matches [

# Version Detection # Install Page # ./setup/install.php
{ :version=>/<div id="nav">[\s]+<ul id="sub_nav">[\s]+<li>osTicket version ([^\-^<]+) - Basic installation<\/li>[\s]+<\/ul>[\s]+<\/div>/ },

# Install Page # Title # ./setup/install.php
{ :regexp=>/<title>osTicket Installer<\/title>[\s]+<link rel="stylesheet" href="style\.css" media="screen">/ },

# Powered by image HTML
{ :regexp=>/<a id="powered_by" href="http:\/\/osticket\.com"><img src="\.\/images\/poweredby\.jpg" width="126" height="23" alt="Powered by osTicket"><\/a><\/div>/ },

]

end

