##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Batavi" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-23
version "0.1"
description "Batavi open source e-commerce"
website "http://www.batavi.org/"

# Google results as at 2012-02-23 #
# 4 for intitle:"Batavi Administration Tool" "Log Into The Administration Tool"

# Dorks #
dorks [
'intitle:"Batavi Administration Tool" "Log Into The Administration Tool"'
]



# Matches #
matches [

# Powered by footer # Version Detection
{ :version=>/<p align="center"><a href="http:\/\/www\.batavi\.org" target="_blank" class="poweredByButton"><span class="poweredBy">Powered By<\/span><span class="Batavi">Batavi ([^<]+)<\/span><\/a><\/p>/ },

# Meta Generator
{ :text=>'<meta name="generator" content="Batavi.org - Open Source E-Commerce" />' },

# Meta Generator # Version Detection
{ :version=>/<meta name="Generator" content="Batavi ([^\}^>]+)" \/>/ },

# X-Powered-By Header
{ :search=>"headers[x-powered-by]", :regexp=>/Batavi e\-commerce/ },

# Set-Cookie # frontsid
{ :search=>"headers[set-cookie]", :regexp=>/frontsid=[^;]+;/ },

]

end

