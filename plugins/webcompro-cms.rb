##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WEBCOMpro-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-14
version "0.1"
description "WEBCOMpro CMS"
website "http://www.webcompro-cms.com/"

# ShodanHQ results as at 2011-08-14 #
# 6 for WEBCOMpro CMS

# Google results as at 2011-08-14 #
# 20 for module/interface.php?ifc_page=licence 

# Dorks #
dorks [
'inurl:module/interface.php?ifc_page=licence'
]



# Matches #
matches [

# Version Detection # X-Powered-By Header
{ :search=>"headers[x-powered-by]", :version=>/WEBCOMpro CMS (.+)$/ },

# wcp_userid Cookie
{ :search=>"headers[set-cookie]", :regexp=>/wcp_userid=[\d]{10};/ },

# wcp_userid_temporary Cookie
{ :search=>"headers[set-cookie]", :regexp=>/wcp_userid_temporary=[\d]{10};/ },

# Meta Generator
{ :regexp=>/<meta name="generator" content="WEBCOMpro CMS ([^\s]+) . Patrick Heyer, www\.webcompro-cms\.com">/ },

]

end

