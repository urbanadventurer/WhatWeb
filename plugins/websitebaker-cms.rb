##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebsiteBaker-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-14
version "0.1"
description "WebsiteBaker open source content management system (CMS)."
website "http://www.websitebaker2.org"

# Google results as at 2011-08-14 #
# 227 for "powered by websitebaker"

# Dorks #
dorks [
'"powered by websitebaker"'
]



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="WebsiteBaker ([\d\.]+) CMS; www\.websitebaker2?\.org"[\s]?\/?>/ },

# Powered by footer
{ :regexp=>/[pP]owered by <a href="http:\/\/www\.websitebaker2?\.org"( target="_blank")?>WebsiteBaker<\/a>/ },

# Cookie
{ :search=>"headers[set-cookie]", :regexp=>/wb_[\d]{4}_session_id=[^;]+;/ },
{ :search=>"headers[set-cookie]", :regexp=>/wb_session_id=[^;]+;/, :certainty=>75 },

]

end

