##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "KSearch" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-20
version "0.1"
description "KSearch is the easiest website search engine to integrate, implement and use. KSearch is fully customizable - you can add or remove any features you want, without permission. KSearch is Open Source Software."
website "http://www.kscripts.com/"

# Google results as at 2011-03-20 #
# 159 for "Powered by KSearch" inurl:ksearch.cgi filetype:cgi

# Dorks #
dorks [
'"Powered by KSearch" inurl:ksearch.cgi filetype:cgi'
]



# Matches #
matches [

# GHDB # powered by and filename
{ :ghdb=>'"Powered by KSearch" inurl:ksearch.cgi filetype:cgi' },

# Version Detection # Powered by link
{ :version=>/Powered by[\s]+<a[^>]+href="http:\/\/www\.kscripts\.com\/(scripts\.html#ksearch)?"[^>]*>KSearch[\s]+([\d\.]+[a-z]?)[\s]*<\/a>/, :offset=>1 },

# Powered by link
{ :regexp=>/Powered by[\s]+<a[^>]+href="http:\/\/www\.kscripts\.com\/(scripts\.html#ksearch)?"[^>]*>KSearch<\/a>/ },

]

end


