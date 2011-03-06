##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Updated version detection
##
Plugin.define "RunCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.2"
description "RunCms is Ease Of Use for webmasters. One of the worlds finest free CMS systems. - homepage: www.runcms.org/"

# Google results as at 2010-07-11 #
# 57 for "powered by RunCMS" -Vulnerability -exploit inurl:module inurl:viewcat.php

# Examples #
examples %w|
www.runcms.org/modules/links/viewcat.php?cid=2
www.rune-federation.org/modules/mydownloads/viewcat.php?cid=4
www.jattworld.com/portal/modules/mysections/viewcat.php?cid=1
www.thaibadminton.com/main/modules/adresses/viewcat.php?cid=1
mondialplomelin.net/modules/photo/viewcat.php?cid=13
www.xvid.gr/modules/mylinks/viewcat.php?cid=0
boguchar.ws/modules/mylinks/viewcat.php?cid=1
www.ilincagorobet.ase.md/modules/mydownloads/viewcat.php?cid=1
www.fenomenibg.com/modules/mylinks/viewcat.php?cid=4
runcms.uw.hu/modules/mydownloads/viewcat.php?cid=2
exe-community.com.ru/modules/mydownloads/viewcat.php?cid=7
stusti.patrick-bernau.de/modules/mylinks/viewcat.php?cid=1
www.cpmdq.com/modules/mylinks/viewcat.php?cid=11
www.assisi.sk/modules/mylinks/viewcat.php?cid=2
www.ideabyidea.com/main/modules/mylinks/viewcat.php?cid=10
www.starwars.alfaspace.net/modules/mydownloads/viewcat.php?cid=7
www.alssrhan.com/modules/mysections/viewcat.php?cid=1
yaoigames.ru/tenma/modules/mydownloads/viewcat.php?cid=5
sitefree.ru/modules/mydownloads/viewcat.php?cid=15
egpic.6te.net/modules/bamagalerie3/viewcat.php?id=11
3gpvideo.ru/modules/files/viewcat.php?cid=3
atom.alfaspace.net/modules/mydownloads/viewcat.php?cid=1
www.agifish.com.vn/home_en/modules/photo/viewcat.php?cid=1
|

# Matches #
matches [

# GHDB Match
{ :ghdb=>'"powered by RunCMS" inurl:module inurl:viewcat.php' },

# Version Detection # Powered by text
{ :version=>/<div align='center'><a href='http:\/\/www.runcms.org\/' target='_blank'> Powered by  RunCms ([\d\.a-z]+)[^&]* &copy; [\d]{4}-[\d]{4} / },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="[\s^"]*RUNCMS ([\d\.a-z]+)[^"]*"/i },

]

end

