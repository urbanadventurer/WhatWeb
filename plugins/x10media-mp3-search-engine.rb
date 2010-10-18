##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X10media-MP3-Search-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.1"
description "X10media MP3 search engine - homepage: http://www.x10media.com/mp3-script.php"

# 134 results for "powered by x10media.com a MP3 Search Script" @ 2010-08-01
# 196 results for "This search engine is in no way intended for illegal downloads. " @ 2010-08-01
examples %w|
x10media.com/mp3/
buscomusic.com
findmp3s.com
freemusictown.com/install/
justfreemp3.com
mp3iseasy.com
mp3source.us
mp3url.net
musicprowler.com
myfreemp3s.org
searchjams.com
songthief.com/search/
www.smokingmp3.com
osmp3.com
www.burunet.com
www.easymp3.eu
www.fastdownloadmp3.com
www.freemp3musicdownloads.ca/search/
www.freemusicdownloadwebsites.com/mp3-search-engine/
www.indiamp3.com
www.itrackz.net
www.mp351.com
www.mp3download1.com
www.mp3lover.info
www.mp3moo.com
www.mp3plasma.com
www.mp3source.us/mp3/
www.mp3wap.net
www.musicjaja.com
www.musicxposure.nl
www.myfavmusic.net
www.nutcentre.com
www.playlistrus.com
www.rosimusic.com
www.savemp3.net
www.searchmuzik.com
www.searchsongs.net
|

matches [

{ :text=>'	<meta name="copyright" content="X10Media"/>', :certainty=>75 },
{ :text=>'	<meta name="contributor" content="X10Media"/>', :certainty=>75 },
{ :text=>"<title>x10media Mp3 Search Engine</title>" },
{ :text=>'Powered by <a href="http://www.x10media.com">x10media.com</a> a <a href="http://www.x10media.com/mp3-script.php">MP3 Search Script</a>' },
{ :text=>'Cannot connect to the database. Possibly, the X10Media Mp3 Search engine is not installed. Click <a href="install/">here</a>, to install it.' },

]

def passive
        m=[]

        if @body =~ /<meta name="publisher" content="x10media`s Mp3 Search Engine V\.[\d\.]+"\/>/
                version=@body.scan(/<meta name="publisher" content="x10media`s Mp3 Search Engine V\.([\d\.]+)"\/>/)[0][0]
                m << {:version=>version}
        end

        if @body =~ /<meta name="dc\.rights" content="x10media`s Mp3 Search Engine V\.[\d\.]+"\/>/
                version=@body.scan(/<meta name="dc\.rights" content="x10media`s Mp3 Search Engine V\.([\d\.]+)"\/>/)[0][0]
                m << {:version=>version}
        end

        if @body =~ /<meta name="dc\.publisher" content="x10media`s Mp3 Search Engine V\.[\d\.]+"\/>/
                version=@body.scan(/<meta name="dc\.publisher" content="x10media`s Mp3 Search Engine V\.([\d\.]+)"\/>/)[0][0]
                m << {:version=>version}
        end

        if @body =~ /<meta name="owner" content="x10media`s Mp3 Search Engine V\.[\d\.]+"\/>/
                version=@body.scan(/<meta name="owner" content="x10media`s Mp3 Search Engine V\.([\d\.]+)"\/>/)[0][0]
                m << {:version=>version}
        end

        if @body =~ /<title>x10media`s Mp3 Search Engine V\.[\d\.]+[\ Installer]*<\/title>/
                version=@body.scan(/<title>x10media`s Mp3 Search Engine V\.([\d\.]+)[\ Installer]*<\/title>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

