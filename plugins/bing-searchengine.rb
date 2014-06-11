##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :name, :certainty=>100, and changed regexp to text

Plugin.define "Bing-SearchEngine" do
author "Andrew Horton"
version "0.1"
description "Bing.com is Microsoft's search engine"


#

matches [
{:text=>'var curUrl="http://www.bing.com/"' },
{:text=>'<meta content="Bing is a search engine that finds' }
]

end

