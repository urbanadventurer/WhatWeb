##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpGraphy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-06
version "0.1"
description "phpGraphy is a free PHP photo gallery script released under GPL license. - Homepage: http://phpgraphy.sourceforge.net/"

# Google results as at 2011-05-06 #
# 397 for "This site is using phpGraphy" -intitle
# 389 for "This site is using phpGraphy" -intitle intitle:"my phpGraphy site"

# Dorks #
dorks [
'"This site is using phpGraphy" -intitle'
]

# Examples #
examples %w|
christinespics.com
armaina.com/phpgraphy/
www.crokeroars.com/phpgraphy/index.php
www.dbuc.org.au/Photos%20Gallery/phpgraphy-0.9.13a/index.php
ruppertsecken.homeip.net/phpgraphy-0.9.13a/index.php
www.cansoma.org/phpgraphy/phpgraphy/index.php
www.apim.org.mo/ccm/gallery/
www.hovima-hotels.com/hires-gallery/index.php
www.bmjenkins.com.au/index.php
www.kuriachira.com/phpgraphy/index.php
www.osteriadeisapori.com.au/italian-restaurant/gallery/index.php
www.gxseries.com/gallery/index.php
silvanolte.com/photos/index.php
kawalec.org
www.phys.ethz.ch/~swood/lcft/gallery/index.php
www.custom4x4fabrication.com/gallery/
applesofthemoon.com/phpgraphy/index.php
www.hoefler-photography.com/phpgraphy/index.php
www.sgvideo.com/aurora/phpgraphy-0.9.13a/index.php
www.cheeransoftware.com/photo/phpgraphy-0.9.13b/index.php
sollex.info/phpgraphy/index.php
siraaca.org/phpgraphy/index.php
www.sollex.org/phpgraphy/
mementh.com/phpgraphy/index.php
earthbuild.com/gallery2/phpgraphy-0.9.10/
www.alexladd.com
|

# Matches #
matches [

# Title
{ :text=>'<title>my phpGraphy site</title>' },

# Version Detection # Powered by footer
{ :version=>/This site is using <a href="http:\/\/phpgraphy\.sourceforge\.net\/">phpGraphy<\/a>\n([^\s]+) - Page generated in [\d\.]+s\.<\/div><!--\/\/footer-->/ },

]

end


