##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "TribuneNews" do
author "Shuai Lin"
version "0.1"
description "TribuneNews is a news website engine for sites of Tribune Newspaper."

examples %w|
http://www.mcall.com/
http://www.baltimoresun.com/
http://www.chicagotribune.com/
|

matches [

{ :text=> '<a href="http://www.tribune.com/" target="_parent">A Tribune Newspaper website</a>' }

]

end
