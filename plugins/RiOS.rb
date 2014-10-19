##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RiOS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "Riverbed Optimization System (RiOS)"
website "http://www.riverbed.com/"

# Technical Overview #
# http://www.riverbed.com/assets/fr/media/documents/briefs/TechOverview-Riverbed-RiOS_6.0.pdf

# ShodanHQ results as at 2012-08-26 #
# 286 for X-RBT-Optimized-By



# Matches #
matches [

# X-RBT-Optimized-By Header
{ :search=>"headers[x-rbt-optimized-by]", :version=>/\(RiOS ([^\s]+)\)/ },

# X-RBT-Optimized-By Header
{ :search=>"headers[x-rbt-optimized-by]", :string=>/(.+) \(RiOS/ },

]

end

