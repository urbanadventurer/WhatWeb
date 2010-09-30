##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Plogger" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "Plogger is the next generation in open-source photo gallery systems. - homepage: http://www.plogger.org/"

# 328 results for "powered by Plogger" @ 2010-09-18
examples %w|
cantillano.com
gallery.onetruegem.com
mysmc.org/gallery/
tmcyouth.com/summits/photos/
www.africanlibraryproject.org/plogger/index.php
www.atifaslam.biz/photo-gallery/
www.davidperrett.com/plogger/
www.fishnwater.com
www.fotosindonesia.com
www.geoartworks.com
www.inlinestorefixtures.com/gallery/
www.johndenhamhouse.com/plogger/index.php
www.liadane.com/gif/
www.philipmorrisbreakup.org/worldtour/
www.tangoalchemie.com/gallery/
www.rates-billing.net/bi/index.php
www.sluttygfs.net
www.texanmom.com
www.tibetanpaintings.com/photos.php
www.wallz4u.com
|

matches [

# Default title
{ :regexp=>/<title>[^powered]+powered by Plogger Gallery<\/title>/ },

# Powered by text
{ :regexp=>/<a[\ title="Powered by Plogger"]* href="http:\/\/www.plogger.org\/">Powered by Plogger[!]*<\/a>/ },

]

end

