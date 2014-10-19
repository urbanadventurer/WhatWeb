##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "MyZone" do
author "Andrew Horton"
version "0.1"
description "Mobile 3G WiFi Rrouter"
website "www.netcomm.com.au"


matches [
{:regexp=>/<title>MyZone<\/title>.*www\.netcomm\.com\.au/m}
]

end

