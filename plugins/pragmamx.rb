##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "pragmaMx" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-29
version "0.1"
description "pragmaMx - CMS"
website "http://www.pragmamx.org/"

# Google results as at 2012-05-29 #
# 325 for "Diese Webseite basiert auf pragmaMx"

# Dorks #
dorks [
'"Diese Webseite basiert auf pragmaMx"'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- COPYRIGHT www.pragmamx.ca / Ne touchez pas / Do not touch -->' },

# Meta Generator # Version Detection
{ :version=>/<meta name="generator" content="pragmaMx ([^\s]+) - by http:\/\/pragmaMx\.org" \/>/ },

# pmx-templatesystem # Module # HTML Comment
{ :module=>/<!-- (pmx-templatesystem v[^\s^\/]+)\/20[\d]{2}-[\d]{2}-[\d]{2} -->/ },

# Footer # Version Detection
{ :version=>/<p>Diese Webseite basiert auf pragmaMx ([^\s]+)\.<\/p>/ },

]

end

