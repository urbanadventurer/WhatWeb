##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "ZebraNet-PrintServer" do
author "Andrew Horton"
version "0.1"
description "Print Server for Zebra mobile printers. Provides a wireless/ethernet network interface for parallel port printers. Uses listed on the website range from  card printers, kiosk printers, mobile printers, RFID printers, to industrial printers"
website "http://www.zebra.com/us/en/products-services/accessories/print-servers.html"



# 8 for "ZebraNet PrintServer"  "Status and Configuration" "Cancel Job" -guide

# Dorks #
dorks [
'"ZebraNet PrintServer" "Status and Configuration" "Cancel Job" -guide'
]

matches [
{:name=>"h1 tag",
:string=>/<H1>([^\)]+) - ZebraNet PrintServer<\/H1>/}
]

end

