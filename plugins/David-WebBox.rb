##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "David-WebBox" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-27
version "0.1"
description "David WebBox is a remote data storage center. - Homepage: http://www.tobit.com/davidfx/access/"

# ShodanHQ results as at 2011-08-27 #
# 9,486 for David-WebBox

# Google results as at 2011-08-27 #
# 14 for intitle:"David InfoCenter Web"

# Examples #
examples %w|
212.95.117.189
mailvie.sytes.net:8080
hamch.dyndns.org
www.wkk-uetersen.de
92.51.137.157:8081
217.91.73.248
84.61.27.105
78.140.90.130
78.42.180.198
91.66.55.222
85.16.66.157
83.216.239.196
80.153.102.47
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^David-WebBox\/([^\s]+ \([^\)]+\))$/ },

]

end

