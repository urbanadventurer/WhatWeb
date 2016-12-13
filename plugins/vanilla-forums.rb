##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Vanilla-Forums" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-11
version "0.1"
description "Vanilla Forums - open-source, standards-compliant, customizable discussion forums."
website "http://vanillaforums.org/"

# ShodanHQ results as at 2012-04-11 #
# 81 for X-Garden-Version
# 74 for Set-Cookie Vanilla=deleted



# Matches #
matches [

# Version Detection # X-Garden-Version Header
{ :search=>"headers[x-garden-version]", :version=>/^Vanilla ([^\s]+)$/ },

# Powered by link # Version Detection
{ :version=>/Powered by <a href="(http:\/\/)?getvanilla\.com\/?">Vanilla ([^\s^<]+)<\/a>/, :offset=>1 },

# Vanilla=deleted Cookie
{ :search=>"headers[set-cookie]", :regexp=>/Vanilla=deleted; expires=/ },

# body id
{ :certainty=>25, :regexp=>/<body id=["'](DiscussionsPage|vanilla)/i },

]

end

