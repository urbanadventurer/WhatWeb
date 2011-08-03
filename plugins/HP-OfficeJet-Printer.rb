##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "HP-OfficeJet-Printer" do
author "Andrew Horton"
version "0.1"
description "Printer"
examples %w|  211.234.22.171 |


matches [
{:version=>/<title>HP Officejet ([^<]+)<\/title>/ }
]

end

