##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2 by Andrew Horton. Updated everything

Plugin.define "HP-OfficeJet-Printer" do
author "Andrew Horton"
version "0.2"
description "HP Officejet Pro and Officejet printers"
website "http://www.hp.com/products1/inkjetprinter/officejet.html"

# a list of all OfficeJet models can be found here: http://www8.hp.com/us/en/support-drivers.html

# Tested on:
# 4500 G510n-z,6000 E609a,6000 E609n,6500 E709a,6500 E709n,7000 E809a,
# J4680 series,J6400 series,Pro 8000 A809,Pro 8500 A909g,Pro K5400,
# Pro K550,Pro K850,Pro K5400Pro K8600,Pro L7500,Pro L7600

dorks [
'intitle:"HP Officejet" inurl:index.htm'
]




matches [
# for 4500 G510n-z,6000 E609a,6500 E709a,Pro L7500,Pro L7600,J4680 series, Pro K8600
{:model=>/<title>HP Officejet ([^<]+)<\/title>.*<body onLoad="window.top.location.href='.\/index.htm\?cat=info&page=printerInfo/m },
# for K550, K850, Pro 8000 A809
{:model=>/<title>HP Officejet (Pro [A-Z0-9a-z ]+)<\/title>.*(home.htm\?cat=home&page=home|printerFrame.htm)/m},
{:text=>'index.htm?cat=info&page=printerInfo'},
{:certainty=>25, :text=>'home.htm?cat=home&page=home'}

]

end
