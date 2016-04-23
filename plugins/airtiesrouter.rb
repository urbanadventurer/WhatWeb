##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "AirTiesRouter" do
author "Andrew Horton"
version "0.1"
description "AirTies Wireless Router"
website "http://www.airties.com/"


matches [
{:version=>/<title>Airties ([^<]+)</}
]

end

