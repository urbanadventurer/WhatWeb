##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "InterRed" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "InterRed GmbH is a leading technology provider of content management systems (CMS), Knowledge Retrieval (KM), personalization of web sites, live reporting (website statistics) to use analysis of websites and offers print solutions for catalogs, magazines, newspapers Web-to-print, publishing houses."
website "http://www.interred.de/"



# Matches #
matches [

# Version Detection # HTML Comment
{ :version=>/<meta name="(generator|GENERATOR)" content="InterRed V([^,]+), http:\/\/www\.interred\.de\/, InterRed GmbH"( \/)?>/, :offset=>1 },

# Version Detection # Meta Generator
{ :version=>/<!-- Created with InterRed V([^,]+), http:\/\/www\.interred\.de\/, by InterRed GmbH -->/ },

]

end


