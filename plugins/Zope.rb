##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zope" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-02
version "0.1"
description "Zope is an open source web application server primarily written in the Python programming language. It features a transactional object database which can store not only content and custom data, but also dynamic HTML templates, scripts, a search engine, and relational database (RDBMS) connections and code."
website "http://www.zope.org/"

# ShodanHQ results as at 2010-11-02 #
# 6,219 for Server: Zope

# Google results as at 2012-03-14 #
# 88 for inurl:"HelpSys" intitle:"Zope Help System"
# 40 for inurl:"HelpSys?help_url="

# Dorks #
dorks [
'inurl:"HelpSys" intitle:"Zope Help System"'
]



# Matches #
matches [

# Version # HTTP Server Header
{ :search=>"headers[server]", :version=>/Zope\/\(([^,]*)/ },

# Python # HTTP Server Header
{ :search=>"headers[server]", :module=>/Zope\/\([^,]*, ([^,]*)/ },

# OS # HTTP Server Header
{ :search=>"headers[server]", :string=>/Zope\/\([^,]*, [^,]*, ([^\)^\s]*)/ },

]

end

