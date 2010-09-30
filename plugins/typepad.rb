##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100 & :name

Plugin.define "TypePad" do
author "Andrew Horton"
version "0.2"
description "Blogging platform http://www.typepad.com/"
# identifying strings
# <meta name="generator" content="http://www.typepad.com/" />

matches [
{:text=>'<meta name="generator" content="http://www.typepad.com/"'}
]

end




