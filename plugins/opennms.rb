##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenNMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-25
version "0.1"
description "OpenNMS - Enterprise-Grade Network Management Application Platform"
website "http://www.opennms.com/"

# Source: http://sourceforge.net/projects/opennms/
# Default Port: 8980
# Default Login: admin/admin

# Google results as at 2012-04-25 #
# 25 for intitle:"OpenNMS Web Console" "User" "Password" "OpenNMS Copyright"

# Dorks #
dorks [
'intitle:"OpenNMS Web Console" "User" "Password" "OpenNMS Copyright"'
]



# Matches #
matches [

# Login Page # Logo HTML
{ :regexp=>/<h1 id="headerlogo"><a href="[^"]*index\.jsp"><img src="[^"]*images\/logo\.png" alt="OpenNMS Web Console Home"\/><\/a><\/h1>/ },

# Login Page # Footer # Year Detection
{ :string=>/<p>\s+OpenNMS <a href="(support|help)\/about\.jsp">Copyright<\/a> &copy; 2002-(20[\d]{2})\s+/, :offset=>1 },

# Login Page # Remember me link
{ :regexp=>/<p><input type="checkbox" name="_(spring|acegi)_security_remember_me"> Don't ask for my password for two weeks<\/p>/ },

]

end

