##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Piwigo" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-12
version "0.1"
description "Piwigo is a photo gallery software for the web, built by an active community of users and developers."
website "http://piwigo.org/"

# Google results as at 2010-09-12 #
# 271 results for "powered by piwigo"

# Dorks #
dorks [
'"powered by piwigo"'
]



# Matches #
matches [

# Meta generator
{ :text=>'<meta name="generator" content="Piwigo (aka PWG), see piwigo.org">' },
{ :text=>'<meta name="generator" content="Piwigo, piwigo.org">' },

# div id="copyright" # a name="EoP" # HTML Comment
{ :regexp=>/<div id="copyright">\s+<a name="EoP"><\/a>\s+<!-- End of Page -->/ },

# Powered by
{ :regexp=>/Powered by\s+<a href="http:\/\/piwigo\.org" class="Piwigo">/ },

]

end

