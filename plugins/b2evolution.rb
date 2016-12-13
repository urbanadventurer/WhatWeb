##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "b2evolution" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-11
version "0.1"
description "b2evolution is a powerful blog tool you can install on your own website."
website "http://b2evolution.net/"

# Dorks #
dorks [
'"Powered by b2evolution"'
]

# 482 results for "Powered by b2evolution" @ 2010-10-11



matches [

# Default image HTML
{ :regexp=>/rsc\/img\/powered-by-b2evolution-150t.gif" alt="Powered by b2evolution"/i },

# Version detection # Login page
{ :version=>/<p class="footer"><a href="http:\/\/b2evolution.net\/" title="visit b2evolution's website"><strong>b2evolution ([^<]+)<\/strong><\/a>/ },

# Version detection # Meta generator
{ :version=>/<meta name="generator" content="b2evolution ([^\"]+)" \/>/ },

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/b2evolution.net[\/]*"[^>]+>b2evolution<\/a>/ },

]

end

