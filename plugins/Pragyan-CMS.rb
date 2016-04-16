##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pragyan-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "A simple and fast multiuser content management system to organize collaborative web-content. This CMS allows very fine user&group permissions, generating pages like articles, forms, quizzes, forums, etc, search powered by sphider."
website "http://sourceforge.net/projects/pragyan/"

# Google results as at 2011-02-27 #
# 80 for "powered by Pragyan CMS"

# Dorks #
dorks [
'"powered by Pragyan CMS"'
]



# Matches #
matches [

# Powered by text
{ :text=>'powered by <a href="http://sourceforge.net/projects/pragyan">Pragyan CMS</a>' },

# Version Detection # Powered by text
{ :version=>/powered by <a href="http:\/\/sourceforge.net\/projects\/pragyan" title="(Praygan|Probe) CMS">Pragyan CMS v([\d\.]+)<\/a>/, :offset=>1 },

]

end


