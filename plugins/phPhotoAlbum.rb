##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phPhotoAlbum" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.1"
description "PHP Photo Album - homepage: http://www.phphq.net/?script=phPhotoAlbum"

# 4 results for "powered by PHPhotoalbum" intitle:My Picture Album" @ 2010-08-14
examples %w|
www.hardmaps.com/BOTD/BOTD/phPhotoAlbum.php
www.keshershalosh.com/photos/album.php
oldstyle.3x.ro/Album/index.php
|

matches [

{ :text=>'<title>My Picture Album</title>', :certainty=>75 },

]

# Version detection using powered by footer text
def passive
        m=[]

        if @body =~ /<td align="right"><font style="font-face:Verdana; font-size:9; font-color:#000000;">Powered By: <a href="http:\/\/www.phphq.net\/\?script=phPhotoAlbum" target="_blank"><b>phPhotoAlbum v[\d\.]+<\/b><\/a><\/font><\/td>/
                version=@body.scan(/<td align="right"><font style="font-face:Verdana; font-size:9; font-color:#000000;">Powered By: <a href="http:\/\/www.phphq.net\/\?script=phPhotoAlbum" target="_blank"><b>phPhotoAlbum v([\d\.]+)<\/b><\/a><\/font><\/td>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

