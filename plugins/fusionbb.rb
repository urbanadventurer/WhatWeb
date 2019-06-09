##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "FusionBB"
authors [
  "Claudio Salazar",
]
version "0.1"
description "FusionBB is a PHP forum."

matches [

{:version=>/FusionBB&trade; Version (\d+\.?\d+?)/,  :name=>"version" },

]

end
