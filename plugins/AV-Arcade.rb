##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AV-Arcade" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description " - homepage: http://www.avscripts.net/avarcade/"

# 284 results for "powered by AV Arcade" -Vulnerability @ 2010-09-18
examples %w|
www.demo.avarcadepro.com
ahliang.com/arcade/
flashgames4u.info
flashgamesweb.com
mouza-trans.com
www.arcadeelf.com
www.dhoytt.com/games/flash/av_arcade/
www.firefreak.net
www.games-volcano.net
www.gmhs2008.org
www.newonlineflashgames.com
www.geniusarcade.com
www.ninjaclanarcade.com
www.zupergames.net
|

matches [

# HTML comment
{ :text=>'<!--MUST BE INCLUDED IN ALL TEMPLATES AND UNMODIFIED UNLESS YOU HAVE PAID FOR COPYRIGHT REMOVAL-->' },
{ :text=>'	  <!--MUST BE INCLUDED IN ALL TEMPLATES AND UNMODIFIED UNLESS YOU HAVE PAID FOR COPYRIGHT REMOVAL-->', :version=>"3.x" },

# Powered by text
{ :text=>'<b><span class="copytext">Powered by <a href="http://www.avscripts.net/avarcade/">AV Arcade Free Edition</a> - Copyright 2006-2010 <a href="http://www.avscripts.net">AV Scripts</a></span></b>', :version=>"Free" },
{ :text=>'<b><span class="copytext">Powered by <a href="http://www.avscripts.net/avarcade/">AV Arcade v3</a> - Copyright 2006-2008 <a href="http://www.avscripts.net">AV Scripts</a></span></b>', :version=>"3.x" },
{ :text=>'Powered by <a href="http://www.avscripts.net/avarcade/">AV Arcade Pro</a> - Copyright <a href="http://www.avscripts.net">AV Scripts</a> 2006-2010 <a href="http://www.avscripts.net"></a>', :version=>"Pro" },
]

end

