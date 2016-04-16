##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-19 #
# Updated version detection
##
Plugin.define "XHP-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.2"
description "XHP CMS - eXpandable Home Page is an easy to install, easy to use, easy to expand content management system (CMS) written in PHP and using MySQL as the database engine."
website "http://xhp.targetit.ro/"

# Google results as at 2010-08-08 #
# 22 for "powered by XHP CMS" "Site engine is copyright"

# Dorks #
dorks [
'"powered by XHP CMS" "Site engine is copyright"'
]



# Matches #
matches [

# Installation page
{ :text=>'<title>XHP installation</title>' },

# Version Detection # Meta Generator
{ :version=>/<meta name="GENERATOR" content="XHP - eXpandable Home Page v([\d\.]+)"\/>/ },

# Version Detection # Powered by footer
{ :version=>/<a href="http:\/\/xhp.targetit.ro\/">Powered by XHP CMS v([\d\.]+)<\/a><br\/><a href="http:\/\/lars.targetit.ro\/">Site engine is copyright/ },

]

end

