##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Jcow" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-20
version "0.1"
description "Jcow - social networking"
website "http://www.jcow.net/"

# Google results as at 2011-05-20 #
# 161 for "Go to" "Admin CP" "Themes" "Username or Email" "Manage Blocks"

# Dorks #
dorks [
'"Go to" "Admin CP" "Themes" "Username or Email" "Manage Blocks"'
]



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="Generator" content="Jcow Social Networking Software\. ([\d\.]+)" \/>/ },

# Version Detection # Powered by footer
{ :version=>/Powered by <a href="http:\/\/www\.jcow\.net" title="Social Networking Software, Community Software" target="_blank"><strong>Jcow<\/strong> ([\d\.]+)<\/a>/ },

# Meta Generator
{ :text=>'<meta name="Generator" content="Powered by Jcow" />' },

# HTML Comments
{ :text=>'<!-- do NOT remove the Jcow Attribution Information -->' },
{ :text=>'<!-- jcow branding -->' },
{ :text=>'<!-- end jcow_application_box -->' },

]

end

