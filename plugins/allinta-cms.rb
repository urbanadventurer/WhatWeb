##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex and version detection
##
Plugin.define "Allinta-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-15
version "0.2"
description "Allinta - easy to use ASP CMS (Content Management System) - professional features & superior value."
website "http://www.allinta.com/"

# Dorks #
dorks [
'"powered by allinta CMS"'
]

# 31 results for "powered by allinta CMS" @ 2010-08-15


matches [

# Default CSS HTML
{ :regexp=>/	<link rel="stylesheet" href="css\/wizard\/t[0-9_]+.css" type="text\/css">/ },
{ :regexp=>/	<link href="css\/wizard\/t[0-9_]+.css" rel="stylesheet" type="text\/css">/ },

# Powered by text
{ :text=>'		<td align="right" class="footerText">Powered by allinta CMS</td>' },

# Default logo HTML
{ :regexp=>/<img src="img\/wizard\/t[0-9_]+\/powered_allinta.gif"[^>]*alt="Powered by Allinta CMS"/ },

# Default image HTML
{ :regexp=>/<img contenteditable="inherit" start="fileopen" height="[0-9]+" src="img\/powered_allinta.gif" width="[0-9]+" \/>/ },

# Admin page # Default title
{ :text=>'<title>allinta.com- aCMS Content Manager</title>' },

# Version detection # HTML comment
{ :version=>/<!-- allintaCMS V([\d\.]+) - http:\/\/www.allinta.com\/ -->/ },

]

end

