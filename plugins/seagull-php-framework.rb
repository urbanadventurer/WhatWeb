##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "Seagull-PHP-Framework" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-12
version "0.2"
description "Seagull is a mature OOP framework for building web, command line and GUI applications. Licensed under BSD, the project allows PHP developers to easily integrate and manage code resources, and build complex applications quickly."
website "http://seagullproject.org/"

# Google results as at 2010-09-12 #
# 101 for "Powered By Seagull PHP Framework"
# 34 for intitle:"Seagull Framework :: Installation"

# Dorks #
dorks [
'"Powered By Seagull PHP Framework"'
]



# Matches #
matches [

# Meta generator
{ :text=>'    <meta name="generator" content="Seagull Framework" />' },

# Powered by text
{ :regexp=>/    Powered by <a href="http:\/\/seagullproject.org[\/]*" title="Seagull framework homepage">Seagull PHP Framework<\/a>/ },

# Default javascript
{ :regexp=>/        var SGL_JS_SESSID[\s]*=/ },

# Help link
{ :regexp=>/<link rel="help" href="http:\/\/trac.seagullproject.org[\/]*" title="Seagull Documentation." \/>/ },

# Error page
{ :text=>'    <title>Seagull Framework :: Installation</title>        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-15" />' },

# Default logo
{ :url=>"/themes/default/images/logo.png", :md5=>"4986dcbd7b531e29c58b5808b1f8cdd3" },

# Version Detection # Powered by text
{ :version=>/    Powered by <a href="http:\/\/seagullproject.org[\/]?" title="Seagull PHP Framework">Seagull PHP Framework<\/a> v([\d\.]+)/ },

]

end

