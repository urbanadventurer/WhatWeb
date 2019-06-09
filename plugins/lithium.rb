##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Lithium"
authors [
  "Mateusz Golewski",
]
version "0.1"
description "A Lithium forum engine."

matches [

{:name=>"BODY id element",
:regexp=>/<body[^>]+id="lia-body"/},

]

end
