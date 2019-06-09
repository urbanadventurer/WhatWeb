##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "OpenID"
authors [
  "Caleb Anderson",
]
version "0.1"
description "openid detection"



matches [
{:name=>"openid",
:regexp=>/<link [^>]*rel=['"](openid\.server|openid\.delegate)['"][^>]*>/i
},

]


end


