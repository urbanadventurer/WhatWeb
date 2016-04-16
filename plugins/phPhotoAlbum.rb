##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-21 #
# Updated version detection
##
Plugin.define "phPhotoAlbum" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.2"
description "PHP Photo Album"
website "http://www.phphq.net/?script=phPhotoAlbum"

# Google results as at 2010-08-14 #
# 4 for "powered by PHPhotoalbum" intitle:My Picture Album"

# Dorks #
dorks [
'"powered by PHPhotoalbum" intitle:My Picture Album"'
]



# Matches #
matches [

# Default Title
{ :text=>'<title>My Picture Album</title>', :certainty=>75 },

# Version Detection # powered by footer text
{ :version=>/<td align="right"><font style="font-face:Verdana; font-size:9; font-color:#000000;">Powered By: <a href="http:\/\/www.phphq.net\/\?script=phPhotoAlbum" target="_blank"><b>phPhotoAlbum v([\d\.]+)<\/b><\/a><\/font><\/td>/ },
        
]

end

