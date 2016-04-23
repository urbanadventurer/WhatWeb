##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenX" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-15
version "0.1"
description "OpenX (aka phpAdsNew) is an open-source ad server, with an integrated banner management interface and tracking system for gathering statistics. With OpenX you can easily rotate paid banners and your own in-house advertisements."
website "http://www.openx.org/"

# Dorks #
dorks [
'intitle:OpenX "Welcome to OpenX" "Forgot your password" "Authentication"'
]



# Matches #
matches [

# body
{ :text=>'<body class="hasInterface hasGradient hasSidebar " onload="initPage();">' },

# div id="oaHeaderBranding" class="brandingAdServer"
{ :text=>'<div id="oaHeaderBranding" class="brandingAdServer">OpenX</div>' },

# Welcome to OpenX
{ :text=>'<span class="tab-s">Welcome to OpenX</span><br />' },

# Version Detection
{ :version=>/<meta name="generator" content="OpenX v([^\s]+) - http:\/\/www\.openx\.org"( \/)?>/ },

]

end

