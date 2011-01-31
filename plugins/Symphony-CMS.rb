##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Symphony-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-31
version "0.1"
description "Symphony CMS - XSLT-powered open source content management system - Homepage: http://symphony-cms.com/"

# Google results as at 2011-01-31 #
# 13 for "powered by symphony CMS 3"

# Examples #
examples %w|
symphony-cms.com
www.iivs.org
tech.carsonsasser.com
keatonbrandt.grotonma.net
www.portfolioni.info
|

# Matches #
matches [

# Powered by text
{ :regexp=>/Powered by <a[^>]+href="http:\/\/www.symphony-cms.com[\/]?">Symphony CMS<\/a>/ },
{ :regexp=>/Powered by <a[^>]+href="http:\/\/symphony-cms.com[\/]?">Symphony CMS<\/a>/ },

# Version Detection # Powered by text
{ :version=>/Powered by <a[^>]+href="http:\/\/www.symphony-cms.com[\/]?">Symphony CMS ([\d\.]{1,3})<\/a>/, :regexp_offset=>0 },
{ :version=>/Powered by <a[^>]+href="http:\/\/symphony-cms.com[\/]?">Symphony CMS ([\d\.]{1,3})<\/a>/, :regexp_offset=>0 },

# Meta Generator
{ :text=>'<meta name="generator" content="Symphony CMS" />' },

]

end


