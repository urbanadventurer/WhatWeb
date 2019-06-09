##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "TribuneNews"
authors [
  "Shuai Lin",
]
version "0.1"
description "TribuneNews is a news website engine for sites of Tribune Newspaper."

matches [

{ :text=> '<a href="http://www.tribune.com/" target="_parent">A Tribune Newspaper website</a>' }

]

end
