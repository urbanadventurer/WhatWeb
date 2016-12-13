##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "gitstat" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-23
version "0.1"
description "gitstat is a web-based statistics and monitoring system for git"
website "http://sourceforge.net/projects/gitstat/"

# Google results as at 2011-06-23 #
# 10 for "Powered by gitstat"

# Dorks #
dorks [
'"Powered by gitstat"'
]



# Matches #
matches [

# Version Detection # Malformed Powered by HTML
{ :version=>/<a href="http:\/\/sourceforge\.net\/projects\/gitstat\/"<font size=4>\(Powered by gitstat v([^\)^\s]+)\)<\/font><\/a>/ },

# HTML Comment
{ :text=>'<!-- FIXME: We should have some reference to the website of the git tree if available -->' },

# Powered by footer
{ :text=>'Powered by <a href="http://sourceforge.net/projects/gitstat/">gitstat</a> <br><img src="images/separator.gif" alt="" />Design: <a href="http://www.oswd.org/">OSWD.ORG</a></p>' },

]

end

