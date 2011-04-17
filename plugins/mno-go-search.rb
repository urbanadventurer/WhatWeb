##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3
# changed âo .{3}
##
# Version 0.2
# remove :certainty, :name and vulnerability description
##
Plugin.define "MnoGoSearch" do
author "Andrew Horton"
version "0.3"
description "mnoGoSearch is an opensource website search engine. Homepage http://www.mnogosearch.org"

# Dorks #
dorks [
'"Powered by mnoGoSearch"'
]

# Examples #
examples %w|http://www.uic.asso.fr/mnogosearch http://www.bio-systems.org/cgi-bin/search.cgi http://www.accessinn.com/cgi-bin/search.cgi http://www.zmanda.com/cgi-bin/search.cgi http://physhun.kfki.hu/cgi-bin/search-cncsun.cgi |

# Matches #
matches [

{:regexp=>/Powered by mnoGoSearch .{3} free web search engine software/},
{:certainty=>75, :regexp=>/<title>mnoGoSearch:/},

]


end

