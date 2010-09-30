##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :probability & :name

Plugin.define "Lightbox" do
author "Andrew Horton"
version "0.2"
description "Javascript for nice image popups"

# identifying strings

matches [
{:regexp=>/<script [^>]*(lightbox[^>]*.js)[^>]*/},
]


end
