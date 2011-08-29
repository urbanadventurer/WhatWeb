##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Managed-Fusion-Url-Rewriter" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-29
version "0.1"
description "Managed Fusion Url Rewriter is an HttpModule for the Microsoft ASP.NET Web Framework, or IIS 7.0 Integrated Pipeline. All rules are managed in a plain text using Apache mod_rewrite syntax. - Homepage: http://managedfusion.com/"

# ShodanHQ results as at 2011-08-29 #
# 292 for ManagedFusion

# Examples #
examples %w|
199.38.132.28
195.65.26.74
63.134.200.25
77.220.178.140
59.120.166.169
173.201.37.72
212.214.4.178
38.102.38.209
|

# Matches #
matches [

# X-Rewritten-By Header
{ :search=>"headers[x-rewritten-by]", :regexp=>/^ManagedFusion \(rewriter; reverse-proxy; +http:\/\/managedfusion\.com\/\)$/ },

# Version Detection # X-ManagedFusion-Rewriter-Version Header
{ :search=>"headers[x-managedfusion-rewriter-version]", :version=>/^(.+)$/ },

]

end

