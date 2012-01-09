##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "UrlRewriter_NET" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-16
version "0.1"
description "Open Source URL Rewriter for .NET / IIS / ASP.NET - UrlRewriter.NET is an open-source, light-weight, highly configurable URL rewriting component for ASP.NET 1.1 . 4.0 which provides similar IIS Rewrite capabilities that the Apache web server provides with mod_rewrite and .htaccess. - Homepage: http://urlrewriter.net/"

# ShodanHQ results as at 2011-08-16 #
# 3,892 for UrlRewriter.NET

# Examples #
examples %w|
208.75.213.39
74.122.120.195
76.74.172.137
109.234.205.17
64.129.89.21
64.15.154.213
66.70.11.252
199.191.108.181
67.228.88.211
208.74.201.177
|

# Matches #
matches [

# Version Detection # X-Powered-By Header
{ :search=>"headers[x-powered-by]", :version=>/UrlRewriter\.NET ([^\s]+)/ },

]

end

