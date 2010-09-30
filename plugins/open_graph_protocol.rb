##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


Plugin.define "OpenGraphProtocol" do
author "Caleb Anderson"
version "0.1"
description "open graph protocol"

examples %w| www.salon.com/news/opinion/glenn_greenwald/2010/07/23/intelligence/index.html www.imdb.com|

matches [
{:name=>"open graph",
:regexp=>/<meta [^>]*(property|name)="og:title".*?>/i},

]


end


