##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Updated version detection
##
Plugin.define "X10media-MP3-Search-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.2"
description "X10media MP3 search engine - homepage: http://www.x10media.com/mp3-script.php"

# Google results as at 2010-08-01 #
# 134 for "powered by x10media.com a MP3 Search Script"
# 196 for "This search engine is in no way intended for illegal downloads. "

# Examples #
examples %w|
x10media.com/mp3/
buscomusic.com
mp3man.net
huntmymusic.com
findmp3s.com
freemusictown.com/install/
justfreemp3.com
mp3iseasy.com
mp3source.us
mp3url.net
musicprowler.com
myfreemp3s.org
searchjams.com
wesearchmusic.com
songthief.com/search/
www.smokingmp3.com
osmp3.com
www.burunet.com
www.easymp3.eu
www.justgamerz.com/Nuevo%20Directorio/New%20install/install/
www.baixarmusicas.org/baixar/install/
www.fastdownloadmp3.com
www.freemp3musicdownloads.ca/search/
www.t1712.greatnet.de
www.freemusicdownloadwebsites.com/mp3-search-engine/
www.indiamp3.com
www.itrackz.net
www.officialvideo.org/install/
www.soundtrack.co
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

# Matches #
matches [

# Meta Tags
{ :text=>'	<meta name="copyright" content="X10Media"/>', :certainty=>75 },
{ :text=>'	<meta name="contributor" content="X10Media"/>', :certainty=>75 },

# Default Title
{ :text=>"<title>x10media Mp3 Search Engine</title>" },

# Powered by text
{ :text=>'Powered by <a href="http://www.x10media.com">x10media.com</a> a <a href="http://www.x10media.com/mp3-script.php">MP3 Search Script</a>' },

# Database Error
{ :text=>'Cannot connect to the database. Possibly, the X10Media Mp3 Search engine is not installed. Click <a href="install/">here</a>, to install it.' },

# Version Detection
{ :version=>/<meta name="publisher" content="x10media`s Mp3 Search Engine V\.([\d\.]+)"\/>/ },

{ :version=>/<meta name="dc\.rights" content="x10media`s Mp3 Search Engine V\.([\d\.]+)"\/>/ },

{ :version=>/<meta name="dc\.publisher" content="x10media`s Mp3 Search Engine V\.([\d\.]+)"\/>/ },

{ :version=>/<meta name="owner" content="x10media`s Mp3 Search Engine V\.([\d\.]+)"\/>/ },

{ :version=>/<title>x10media`s Mp3 Search Engine V\.([\d\.]+)[\ Installer]*<\/title>/ },

]

end

