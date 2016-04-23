##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Novell-Sentinel-Log-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-15
version "0.1"
description "Novell Sentinel Log Manager - log management solution"
website "http://www.novell.com/promo/slm/slm25.html"

# Google results as at 2012-07-15 #
# 2 for inurl:"novelllogmanager/views/logManager.html"

# Dorks #
dorks [
'inurl:"novelllogmanager/views/logManager.html"'
]



# Matches #
matches [

# Login Page # Version Detection
{ :version=>/<h1 id="site-logo" class="logo" title="Novell Sentinel Log Manager"><span class="accessible">Novell Identity Audit<\/span><\/h1>\s+<p class="publisher">Novell<\/p>\s+<p class="version">Version ([^>]+)<\/p>/ },

# Supported browsers message
{ :text=>'<p class="content">Novell Sentinel Log Manager supports Firefox 3 (works best on 3.6) and Internet Explorer 8 (works best on 8.0)</p>' },

# Redirect Page
{ :text=>'<META HTTP-EQUIV="refresh" CONTENT="0;URL=/novelllogmanager">' },

]

end

