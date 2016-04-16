##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WordPress-Mobile-Pack" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-29
version "0.1"
description "The WordPress Mobile Pack is a complete toolkit to help mobilize your WordPress site."
website "http://wordpress.org/extend/plugins/wordpress-mobile-pack/"

# ShodanHQ results as at 2011-08-29 #
# 802 for X-Mobilized-By Wordpress



# Matches #
matches [

# Version Detection # X-Mobilized-By Header
{ :search=>"headers[x-mobilized-by]", :version=>/^WordPress Mobile Pack ([^\s]+)$/ },

]

end

