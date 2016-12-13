##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Micro-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-26
version "0.1"
description "Micro CMS"
website "http://www.micro-cms.com/"

# Google results as at 2011-02-26 #
# 23 for "Powered by Micro CMS"

# Dorks #
dorks [
'"Powered by Micro CMS"'
]



# Matches #
matches [

# Powered by text
{ :regexp=>/<div class="footer"><div style="float: left;">Powered by <a href="http:\/\/(tpiha.kset.org|www.micro-cms.com)\/">Micro CMS<\/a> \| <a href="/ },

# Simple powered by text
{ :text=>'Powered by <strong><a href="http://microcms.kset.org/">Micro CMS</a></strong><br />' },

# Admin Page # Default form tag
{ :certainty=>25, :text=>'" method="post"onsubmit="' },

]

end


