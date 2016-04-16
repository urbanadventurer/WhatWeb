##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CitusCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-23
version "0.1"
description "CitusCMS - Open Source Content Management System"
website "http://www.citus-cms.org/"

# Google results as at 2011-06-23 #
# 53 for "Powered by CitusCMS"

# Dorks #
dorks [
'"Powered by CitusCMS"'
]



# Matches #
matches [

# Default title
{ :text=>'<title>Administration &#149; Webseitenname</title>' },

# HTML Comment
{ :text=>'<!-- Powered by CitusCMS - http://www.citus-cms.org -->' },

# Powered by text
{ :text=>'Powered by <a href="http://www.citus-cms.org" target="_blank" title="Powered by CitusCMS"><strong>CitusCMS</strong></a>' },

# Meta Generator
{ :text=>'<meta name="generator" content="CitusCMS - http://www.citus-cms.org" />' },
{ :text=>'<meta name="generator" content="CitusCMS [http://www.citus-cms.org]" />' },

# Version Detection # HTML Comment
{ :version=>/<!-- CitusCMS Core Version: ([^\s]+) -->/ },

]

end

