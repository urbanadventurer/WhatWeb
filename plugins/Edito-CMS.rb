##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Edito-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-20
version "0.1"
description "Edito CMS [Polish]"
website "http://www.edito.pl/"



# Matches #
matches [

# Meta Generator
{ :regexp=>/<meta name="(g|G)enerator" content="(E|e)dito( CMS)? - www\.edito\.pl"[\s]*\/?>/ },

# Powered by link
{ :regexp=>/Powered by[\s]*:?[\s]+<a[^>]+href="http:\/\/www.edito.pl[\/]?"[^>]+title="Edito CMS"[^>]*>/i },

]

end


