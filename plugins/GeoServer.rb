##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GeoServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-26
version "0.1"
description "GeoServer is part of The OpenGeo Suite and allows users to share and edit geospatial data. The GeoServer project is a full transactional Java (J2EE) implementation of the OpenGIS Consortium's Web Feature Server specification and Web Coverage Server specification, with an integrated Web Map Server. - Homepage: http://opengeo.org/technology/geoserver/"

# Google results as at 2011-08-26 #
# 114 for "This GeoServer belongs to" "This GeoServer instance is running version" intitle:"GeoServer: Welcome"
#  22 for intitle:"GeoServer: About GeoServer"

# Dorks #
dorks [
'"This GeoServer belongs to" "This GeoServer instance is running version" intitle:"GeoServer: Welcome"'
]

# Examples #
examples %w|
demo.opengeo.org/geoserver/web/
93.158.64.16/geoserver/web/
129.24.63.138/geoserver/web/
v2.suite.opengeo.org/geoserver/web/
geobretagne.fr/geoserver/web/
speeduperp.se/geoserver/web/
geo.cropster.org/geoserver/web/
wdc.aari.ru:8080/geoserver/web/
50.17.57.6:8080/geoserver/web/
www.lucamorandini.it/geoserver/web/
ldvapp07.fao.org:8030/geoserver/web/
web-karten-portal.de:8080/geoserver/web/
www.meetnetlandschap.nl/web/
64.185.222.206:8080/geoserver/web/
https://geo.vioe.be/geoserver/web/
catalog.usgin.org/geoserver/web/
www.drna.gobierno.pr/geodrna/web/
geonode.sopac.org/geoserver/web/
siscom.ibama.gov.br/geoserver/web/
www.metoc.gov.au/geoserver/web/
services.aad.gov.au/geoserver/web/
geology.data.nt.gov.au/erml/web/
geoserver.agric.wa.gov.au/geoserver/
d3.elgin.gov.uk/g.1.dynamic.live/web/
www.metoc.gov.au/geoserver/web/
www.geoservicos.ibge.gov.br/geoserver/web/
gis.nationalarchives.gov.uk/geoserver/web/
sinpesq.mpa.gov.br/geoserver/web/
www.nottinghamshire.gov.uk/maps/
bhuvan5.nrsc.gov.in/bhuvan/web/
mapa.bialystok.lasy.gov.pl:8080/geoserver/
|

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

