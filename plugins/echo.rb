##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2
# removed :name and :certainty=>100
##
Plugin.define "Echo" do
author "Andrew Horton"
version "0.2"
description "CMS"
website "http://www.helloecho.com/"

# Dorks #
dorks [
'"powered by echo"'
]

# Matches #
matches [
{:regexp=>/<a href="http:\/\/www\.helloecho\.com\/go\/\?[^"]*" target="_blank">powered by echo<\/a>/},
]

end


