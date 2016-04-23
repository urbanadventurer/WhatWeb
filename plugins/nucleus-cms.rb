##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Nucleus-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-23
version "0.1"
description "Nucleus CMS"
website "http://nucleuscms.org/"

# Google results as at 2011-03-13 #
# 3 for intitle:"Nucleus Install" "Install Nucleus" +Hostname +Username +Password

# Dorks #
dorks [
'intitle:"Nucleus Install" "Install Nucleus" "Hostname" "Username" "Password"'
]



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="Nucleus CMS v([^"^>]+)" \/>/ },

# Filepath Detection # install.php
{ :filepath=>/<td>Admin-area <strong>path<\/strong>:<\/td>[\s]+<td><input name="AdminPath" size="60" value="([^"]+)" \/>/ },

# Meta Name
{ :text=>'<meta name="name" content="My Nucleus CMS" />' },

# Version Detection # Footer
{ :version=>/<small>Copyright \| <a href="http:\/\/nucleuscms\.org">Nucleus CMS v([^\s^>]+)<\/a> \|/ },

]

end

