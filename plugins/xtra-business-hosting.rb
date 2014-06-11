##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100 & :name, convert :regexp to :text

Plugin.define "XtraBusinessHosting" do
author "Andrew Horton"
version "0.2"
description "Hosting at Xtra.co.nz"


#<title>Xtra Business: Web Hosting</title>

matches [
{:text=>'<title>Xtra Business: Web Hosting</title>' }
]

end

