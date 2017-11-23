##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define do
name "Xenforo"
author "Mateusz Golewski"
version "0.1"
description "A forum engine."
examples %w|http://www.ifans.com/forums/|

matches [

{:name=>"HTML id element",
:regex=>/<html[^>]+id="XenForo"/},

]

end
