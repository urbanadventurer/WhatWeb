##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "x-pingback" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-28
version "0.1"
description "A pingback is one of three types of linkbacks, methods for Web authors to request notification when somebody links to one of their documents. This enables authors to keep track of who is linking to, or referring to their articles. Some weblog software, such as Movable Type, Serendipity, WordPress and Telligent Community, support automatic pingbacks where all the links in a published article can be pinged when the article is published. - More info: http://en.wikipedia.org/wiki/Pingback"

# About 111664 ShodanHQ results for x-pingback @ 2010-10-28
examples %w|
www.wordpress.com
195.158.41.1
|

matches [

# HTTP Header
{ :header=>/x-pingback: ([^\r^\n]*)/i, :regexp_offset=>0 },

]

end

