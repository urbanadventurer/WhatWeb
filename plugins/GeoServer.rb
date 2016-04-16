##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GeoServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-26
version "0.1"
description "GeoServer is part of The OpenGeo Suite and allows users to share and edit geospatial data. The GeoServer project is a full transactional Java (J2EE) implementation of the OpenGIS Consortium's Web Feature Server specification and Web Coverage Server specification, with an integrated Web Map Server."
website "http://opengeo.org/technology/geoserver/"

# Google results as at 2011-08-26 #
# 114 for "This GeoServer belongs to" "This GeoServer instance is running version" intitle:"GeoServer: Welcome"
#  22 for intitle:"GeoServer: About GeoServer"

# Dorks #
dorks [
'"This GeoServer belongs to" "This GeoServer instance is running version" intitle:"GeoServer: Welcome"'
]



# Matches #
matches [

# Shortcut Icon
{ :text=>'<link rel="shortcut icon" href="resources/org.geoserver.web.GeoServerBasePage/favicon.ico"/>' },
{ :text=>'<link href="resources/org.geoserver.web.GeoServerBasePage/favicon.ico" rel="shortcut icon"/>' },

# Redirect Page
{ :regexp=>/<body>[\s]+<p><b>Redirecting to the actual home page\.<\/b><\/p>[\s]+<p>If you're stuck here, it means you don't have javascript[\s]+enabled\. Javascript is required to actually use the GeoServer admin console.<\/p>[\s]+<\/body>[\s]+<\/html>/ },

# Version Detection # Welcome Page # ./web
{ :version=>/<p>[\s]+<span>This GeoServer instance is running version <strong>([^<^\s]+)<\/strong>\. For more information please contact the <a href="[^"^>]*">administrator<\/a>\.<\/span>[\s]+<\/p>[\s]+<\/div>/ },

# Server Owner # Welcome Page # ./web
{ :string=>/<div id="welcome">[\s]+<p>[\s]+This GeoServer belongs to <a><span>([^<]+)<\/span><\/a>\.[\s]+<\/p>/ },

]

# An aggressive plugin could get the build details and GeoTools version from:
# ./web/?wicket:bookmarkablePage=:org.geoserver.web.AboutGeoServerPage

end

