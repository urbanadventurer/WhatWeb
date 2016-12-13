##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-07 #
# Renamed to all-in-one-SEO-pack.rb 
# Updated version detection method
##
Plugin.define "All-in-one-SEO-Pack" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.2"
description "The all in one SEO pack automatically optimizes your WordPress blog for Search Engines (Search Engine Optimization)."
website "http://wordpress.org/extend/plugins/all-in-one-seo-pack/"



# Matches #
matches [

# HTML comment
{ :text=>'<!-- /all in one seo pack -->' },

# Version Detection # HTML comment

{ :version=>/<!-- All in One SEO Pack ([\d\.]+) by Michael Torbert of Semper Fi Web Design/ },

]

end

