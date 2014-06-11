##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# remove :certainty and :name, change regexp to text

Plugin.define "OkiPBX" do
author "Andrew Horton"
version "0.2"
description "OKI PBX (phone exchange) http://www.oki.com/en/iptel/products/mxsx/maintenance.html"

#
# OKI PBX
# <APPLET CODE="DavisBar.class" ARCHIVE="ipstage.jar"
#   <PARAM NAME="servertype" value="ONLINE">
#    <PARAM NAME="systype"    value="OKI">


matches [
{:text=>'<title>IPstageMaintenanceConsole(PBX)</title>' },
{:text=>'<APPLET CODE="DavisBar.class" ARCHIVE="ipstage.jar"' },
{:text=>'<PARAM NAME="systype"    value="OKI">' }
]

end



