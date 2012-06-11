##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Nielsen-NetRatings-SiteCensus" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-11
version "0.1"
description "SiteCensus is a web analytics tool for smaller sites that integrates a single clear pixel for tracking purposes to client web sites in order to provide the sites with third-party validation of server-side traffic data for advertisers. - Homepage: http://nielsen.com/us/en/"

# Examples #
examples %w|
https://www.networkworld.com/
www.news.com.au
www.huffingtonpost.com
guardiannews.com
bbc.co.uk
|

# Matches #
matches [

# HTML Comment # Version Detection
{ :version=>/<!-- (START|END) Nielsen Online SiteCensus V([^\s]+) -->/, :offset=>1 },

# Country
{ :string=>/<img src="\/\/secure\-([a-z]+)\.imrworldwide\.com\/cgi-bin\/m\?ci=([^\s^"^&]+)/, :offset=>0 },

# ci
{ :account=>/<img src="\/\/secure\-([a-z]+)\.imrworldwide\.com\/cgi-bin\/m\?ci=([^\s^"^&]+)/, :offset=>1 },

]

end

