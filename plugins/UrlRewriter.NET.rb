##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "UrlRewriter_NET" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-16
version "0.1"
description "Open Source URL Rewriter for .NET / IIS / ASP.NET - UrlRewriter.NET is an open-source, light-weight, highly configurable URL rewriting component for ASP.NET 1.1 . 4.0 which provides similar IIS Rewrite capabilities that the Apache web server provides with mod_rewrite and .htaccess."
website "http://urlrewriter.net/"

# ShodanHQ results as at 2011-08-16 #
# 3,892 for UrlRewriter.NET



# Matches #
matches [

# Version Detection # X-Powered-By Header
{ :search=>"headers[x-powered-by]", :version=>/UrlRewriter\.NET ([^\s]+)/ },

]

end

