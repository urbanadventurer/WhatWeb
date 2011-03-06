##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-07 #
# Updated version detection
##
Plugin.define "Atomic-Photo-Album" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.2"
description "Photo album software - homepage: http://atomicpa.sourceforge.net/"

# 12 results for "powered by Atomic Photo Album" -Vulnerabilities inurl:apa_album_ID @ 2010-09-18
# 31 results for "powered by Atomic Photo Album" -Vulnerabilities -inurl @ 2010-09-18

# Examples #
examples %w|
blindcry.dod.net/album/photo.php
photo.monomy.net/2003/photo.php
www.albumceliynico.com.ar/album/album.php
www.brzi.info/foto/album.php
www.cbrandon.com/photos/photo.php
www.fokoinusa.com.ar/album/album.php
www.ftu.se/foto/photo.php
www.jimmysamuelsson.com/photo_album/photo.php
|

# Matches #
matches [

	# Version Detection # Powered by text
	{ :version=>/Powered by <a href="http:\/\/atomicpa.sourceforge.net\/" target="_blank">Atomic Photo Album ([\d\.a-z]+)<\/a>/ },

]

end

