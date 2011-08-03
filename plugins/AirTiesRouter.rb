##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "AirTiesRouter" do
author "Andrew Horton"
version "0.1"
description "AirTies Wireless Router. Homepage: http://www.airties.com/"
examples %w| 94.27.38.92 83.66.121.97 |

matches [
{:version=>/<title>Airties ([^<]+)</}
]

end

