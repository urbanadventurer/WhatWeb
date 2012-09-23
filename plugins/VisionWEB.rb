##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VisionWEB" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-01
version "0.1"
description "VisionWEB - video server web interface - Homepage [offline]: http://www.cieffe.com/"

# ShodanHQ results as at 2012-09-01 #
# 463 for IWeb/1.0

# Google results as at 2012-09-01 #
# 6 for intitle:"VisionWEB" "Insignis Technologies"

# Dorks #
dorks [
'intitle:"VisionWEB" "Insignis Technologies"'
]

# Examples #
examples %w|
151.12.21.34
87.235.126.127
88.2.160.51
81.138.8.20
46.26.195.96
77.251.93.107
80.38.175.254
85.34.54.102
212.73.36.73
taunton.mercedes-benzsouthwest.co.uk
mail.newquayzoo.org.uk
81.57.103.196
|

# Matches #
matches [

# HTTP Server Header
{ :certainty=>75, :search=>"headers[server]", :regexp=>/^IWeb\/([^\s]+)/ },

# / # Version Detection # JavaScript
{ :version=>/VarPageTitle="Proxima\d? DVMS VisionWEB v([^\s^"]+)";/ },

# / # Footer
{ :text=>'<b>CIEFFE srl</b> - "We power Your eyes"<br' },

# / # Meta Copyright # Year Detection
{ :string=>/<meta name="COPYRIGHT" content="&copy; 2001-(2[\d]{3}) Insignis Technologies"/ },


]

end

