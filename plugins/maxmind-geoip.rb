##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MaxMind-GeoIP" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-03
version "0.1"
description "MaxMind JavaScript is a service offered by MaxMind to return the country of your web visitors."
website "https://www.maxmind.com/app/javascript"



# Matches #
matches [

# JavaScript
{ :regexp=>/<script type="(JavaScript|text\/javascript)" src="(http:\/\/)?j\.maxmind\.com\/app\/(country|geoip)\.js"><\/script>/ },

]

end

