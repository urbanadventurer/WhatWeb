##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pandora-FMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-19
version "0.1"
description "Pandora Flexible Monitoring System (FMS) is a performance & availability monitoring system, ready for big environments. It uses agents for local monitoring and can do several kinds of remote network monitoring. Agents works on Linux, Windows, AIX, HP-UX, Solaris and BSD systems."
website "http://pandorafms.org/"

# Google results as at 2011-05-19 #
# 10 for "Login" "Password" "Your IP" intitle:"Pandora FMS - the Flexible Monitoring System"

# Dorks #
dorks [
'"Login" "Password" "Your IP" intitle:"Pandora FMS - the Flexible Monitoring System"'
]



# Matches #
matches [

# Login Page # Default Title
{ :text=>'<title>Pandora FMS - the Flexible Monitoring System</title>' },

# Login Page # Pandora RSS Feed
{ :text=>'<link rel="alternate" href="operation/events/events_rss.php" title="Pandora RSS Feed" type="application/rss+xml" />' },

# Login Page # Version Detection # Logo HTML
{ :version=>/<img src="images\/pandora_logo\.png" style="border:0px;" alt="logo" \/><\/a><br \/>v([^<]+)<\/td><td class="f9b">/ },

]

end

