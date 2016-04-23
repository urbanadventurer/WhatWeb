##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpLDAPadmin" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-01
version "0.1"
description "phpLDAPadmin (also known as PLA) is a web-based LDAP client. It provides easy, anywhere-accessible, multi-language administration for your LDAP server. "
website "http://phpldapadmin.sourceforge.net/"

# Google results as at 2011-08-01 #
# 227 for "Home" "Purge caches" intitle:phpLDAPadmin

# Dorks #
dorks [
'"Home" "Purge caches" intitle:phpLDAPadmin'
]



# Matches #
matches [

# Version Detection # Frameset # Seen on versions 0.9.x and not 1.x
{ :version=>/<head><title>phpLDAPadmin - ([^\s^<]+)[\s]?<\/title><\/head>/ },

# Version Detection # tree.php # Seen on versions 0.9.x and not 1.x
{ :version=>/<h3 class="subtitle" style="margin:0px">phpLDAPadmin - ([^\s^<]+)/ },

# Version Detection # Title
{ :version=>/<title>phpLDAPadmin \(([^\s^\)]+)\) - <\/title>/ },

# Version Detection # div id="ajFOOT"
{ :version=>/<div id="ajFOOT">([^\s^<]+)<\/div><a href="https:\/\/sourceforge\.net\/projects\/phpldapadmin">/ },

# LDAP Server Name Detection
{ :string=>/<td class="icon"><img src="images\/[^\/^"]*\/server.png" alt="Server" \/><\/td><td class="name" colspan="2">([^<]+)<\/td><\/tr>/ },

]

end

