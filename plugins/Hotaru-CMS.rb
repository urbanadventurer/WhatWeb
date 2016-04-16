##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Hotaru-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-17
version "0.1"
description "Hotaru CMS is an open source, plugin-powered PHP content management system (CMS)"
website "http://hotarucms.org/"



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="Hotaru CMS ([^\s^"^>]+)" \/>/ },

]

end

