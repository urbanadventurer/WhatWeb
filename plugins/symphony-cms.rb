##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-31 #
# Renamed from "symphony" to "Symphony-CMS"
# Updated version detection
##
Plugin.define "Symphony-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-12
version "0.1"
description "Symphony CMS - XSLT-powered open source content management system"
website "http://symphony-cms.com/"

# Google results as at 2011-01-31 #
# 13 for "powered by symphony CMS 3"
# Google results as at 2010-09-12 #
# 115 for "powered by Symphony"

# Dorks #
dorks [
'"powered by Symphony"'
]



# Matches #
matches [

# Admin page
{ :text=>'	<title>Symphony | Login</title>' },

# Meta Generator
{ :text=>'<meta name="generator" content="Symphony CMS" />' },

# Powered by text
{ :regexp=>/Powered by <a[^>]+href="http:\/\/www.symphony-cms.com[\/]?">Symphony CMS<\/a>/ },
{ :regexp=>/Powered by <a[^>]+href="http:\/\/symphony-cms.com[\/]?">Symphony CMS<\/a>/ },
{ :text=>'powered by <a href="http://www.symphony21.com">SYMPHONY</a>.' },
{ :text=>'Powered by <a href="http://symphony21.com/">Symphony</a>' },
{ :text=>'Powered by <a class="symphony" href="http://symphony21.com/">Symphony</a>' },
{ :text=>'Powered by <a class="symphony" href="http://symphony-cms.com/">Symphony</a>' },
{ :text=>'Site powered by <a href="http://www.symphony-cms.com" class="external">Symphony</a>' },
{ :text=>'Powered by <a href="http://symphony-cms.com/" rel="external">Symphony</a>' },

# Version Detection # Powered by text
{ :version=>/Powered by <a[^>]+href="http:\/\/www.symphony-cms.com[\/]?">Symphony CMS ([\d\.]{1,3})<\/a>/ },
{ :version=>/Powered by <a[^>]+href="http:\/\/symphony-cms.com[\/]?">Symphony CMS ([\d\.]{1,3})<\/a>/ },

]

end


