##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "vbPortal" do
author "Brendan Coles <bcoles@gmail.com>"
version "0.2"
description "Portal and CMS for vBulletin"
website "http://www.vbportal.com/"

# Google results as for 2010-08-27 #
# 154 for "Portal By vbPortal Version "



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="vbPortal - Copyright 2010" />' },

# HTML Comment
{ :text=>'	<!-- Do not remove  or your scheduled tasks will cease to function -->' },

# Version Detection # Meta generator
{ :version=>/<meta name="generator" content="vbPortal ([\d\.]+)" \/>/ },

# Version Detection # Portal by text
{ :version=>/Portal By vbPortal Version ([\d\.]+)<br \/>/ },

]

end

