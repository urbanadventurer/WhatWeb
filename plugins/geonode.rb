##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GeoNode" do
author "Brendan Coles <bcoles@gmail.com>" # 2016-06-02
version "0.1"
description "GeoNode is a web-based application and platform for developing geospatial information systems (GIS) and for deploying spatial data infrastructures (SDI). "
website "https://github.com/GeoNode/geonode/"

# Dorks #
dorks [
'"Powered by GeoNode" intitle:"Explore Layers"'
]

# Matches #
matches [

# /help link
{ :name => 'Help link',
  :text => '<a href="/help/" rel="tooltip" title="help"><i class="icon-question-sign"></i></a>' },

# Version Detection # powered by footer
{ :name => 'Footer',
  :version => %r{Powered by <a href="http://geonode.org">GeoNode</a> <em>version ([a-z0-9\.]+)</em>} },

]

end

