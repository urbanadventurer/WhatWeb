##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ikonboard" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "PHP powered forum - Homepage [offline] : http://www.ikonboard.com"

# Google results as at 2011-03-17 #
# 238 for "Powered by Ikonboard" ext:cgi

# Examples #
examples %w|
david.abcc.ncifcrf.gov/forum/cgi-bin/ikonboard.cgi
niaid.abcc.ncifcrf.gov/forum/cgi-bin/ikonboard.cgi
www.hexedit.com/cgi-bin/ikonboard.cgi
www.netmax.org/cgi-bin/netmaxforums/ikonboard.cgi?act=NW;f=4;t=5
damnsmalllinux.org/cgi-bin/forums/ikonboard.cgi
www.jodhpur-fetish.com/cgi-bin/ikonboard.cgi
www.backpacker.com/cgi-bin/forums/ikonboard.cgi
www.patricianworld.com/cgi-bin/ikonboard.cgi
www.webchillaz.de/cgi-bin/board/profile.cgi
www.the-penny-dreadful.com/boardofspokane/cgi-bin/ikonboard.cgi
www.ezbsystems.com/cgi-bin/ikonboard.cgi
theladyboyforums.com/cgi-bin/board/ikonboard.cgi
www.hovercontrol.com/cgi-bin/ib3/ikonboard.cgi
www.turkishmusic.org/cgi-bin/ikonboard/topic.cgi
www.myyellowpad.com/cgi-bin/ikonboard/ikonboard.cgi
www.hypertrophy-specific.info/cgi-bin/ib314/ikonboard.cgi
www.sexyloops.co.uk/cgi-bin/theboard_07/ikonboard.cgi
www.ancienttimes.net/cgi/ikonboard/topic.cgi
www.gametv.az/cgi-bin/ib3/ikonboard.cgi
forum.dushanbe.ru/cgi-bin/ib312/ikonboard.cgi
www.lamboreplica.co.uk/cgi-bin/ikonboard.cgi
cwn.comicraft.com/cgi-bin/ikonboard/ikonboard.cgi
www.sexyloops.co.uk/cgi-bin/theboard_07/ikonboard.cgi
www.pacificneotek.com/cgi-bin/ikonboard/printpage.cgi
forums.graphicaction.com.au/cgi-bin/printpage.cgi
www.superbox.ru/cgi-bin/ikonboard/printpage.cgi
www.lifeillumination.com/cgi-bin/ikonboard/printpage.cgi
www.powderburn.net/cgi-bin/ikonboard/printpage.cgi
|

# Matches #
matches [

# HTML Comment
{ :text=>'<!-- iB Copyright Information -->' },

# Version Detection # Powered by link # 3.x
{ :version=>/Powered by <a href="http:\/\/www.ikonboard.com" class="copyright" target='_blank'>Ikonboard<\/a> ([^\s]+) &copy; 20[\d]{2} <a href='http:\/\/www.ikonboard.com' target='_blank'>Ikonboard<\/a>/ },

# Version Detection # Powered by link # 2.x
{ :version=>/Powered by <a href="http:\/\/www.ikonboard.com">Ikonboard v([^<]+)<\/a><br>&copy; 20[\d]{2} Ikonboard.com/ },

# Powered by text # printpage.cgi
{ :regexp=>/<\/td><\/tr><\/table><center><hr><p>[^<]+ [P|p]owered by Ikonboard<br>http:\/\/www.ikonboard.com<br>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="GENERATOR" content="Ikonboard ([^"]+)">/ },

# Error Page # HTML Tag Pattern
{ :certainty=>75, :tagpattern=>"h1,/h1,pre,/pre,p,a,/a,/p" },

]

end


