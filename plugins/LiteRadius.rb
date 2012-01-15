##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LiteRadius" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-14
version "0.1"
description "LiteRadius is a web server software program that interfaces geographic locations to the Google Maps API. Requires PHP and MySQL. - Homepage: http://www.escaperadius.com/er/products/literadius/lr.php"

# Google results as at 2011-07-14 #
# 33 for allinurl: locator.php?long=

# Dorks #
dorks [
'allinurl: locator.php?long='
]

# Examples #
examples %w|
locator.ase.com/blue/locator.php?parsed_page=1&lat=45.4405436315&long=122.710253334&map_graphic=OR&geo_region=us&filter_state=1
www.cocoacamino.com/lr_v10/locator.php?parsed_page=1&lat=43.879828&long=-78.942194&geo_region=ca&user_origin=whitby
www.wrcase.com/dealer/locator.php?parsed_page=3&lat=38.934052578614&long=80.745553008595&map_graphic=WV&geo_region=us
bdindustrial.com/branches/locator.php?parsed_page=3&lat=&long=&geo_region=us&bdi_custom=Bearings+and+Drives
www.whitesboots.com/dealers/locator.php?parsed_page=1&lat=46.5570751&long=-112.2285158&geo_region=us&user_origin=59601
www.spacespecials.com/locator.php?parsed_page=3&lat=34.578485&long=-118.116454&geo_region=us&user_origin=Palmdale,%20California&filter_0=01
www.aslmsmembers.org/sr2_0_0/locator.php?parsed_page=1&lat=29.469700&long=98.529400&map_graphic=USA&geo_region=us&filter_0=
www.bernhardt.com/sr2/locator.php?parsed_page=4&lat=29.572100&long=98.605300&map_graphic=USA&geo_region=us
www.austinair.com/php/locator.php?state=NY&filterCity=Long%20Beach
|

trigger "parsed_page"

# Matches #
matches [

# inurl:locator.php parsed_page lat long
{ :ghdb=>'inurl:locator.php parsed_page lat long' },

]

end

