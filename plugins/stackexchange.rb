##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "StackExchange"
authors [
  "Mateusz Golewski",
]
version "0.1"
description "StackExchange family Q&A forums."

matches [

{:name=>"StackExchange.init() call",
:regexp=>/StackExchange.init/},

]

end
