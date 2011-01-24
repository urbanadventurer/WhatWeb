##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RunCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.1"
description "RunCms is Ease Of Use for webmasters. One of the worlds finest free CMS systems. - homepage: www.runcms.org/"
examples %w|
www.runcms.org/modules/links/viewcat.php?cid=2
www.rune-federation.org/modules/mydownloads/viewcat.php?cid=4
www.jattworld.com/portal/modules/mysections/viewcat.php?cid=1
www.thaibadminton.com/main/modules/adresses/viewcat.php?cid=1
mark-webb.com/modules/mylinks/viewcat.php?cid=1
videosmart.ru/modules/files/viewcat.php?cid=6
mondialplomelin.net/modules/photo/viewcat.php?cid=13
www.xvid.gr/modules/mylinks/viewcat.php?cid=0
lgfiles.net/portal/modules/files/viewcat.php?cid=14
boguchar.ws/modules/mylinks/viewcat.php?cid=1
www.ilincagorobet.ase.md/modules/mydownloads/viewcat.php?cid=1
www.fenomenibg.com/modules/mylinks/viewcat.php?cid=4
runcms.uw.hu/modules/mydownloads/viewcat.php?cid=2
exe-community.com.ru/modules/mydownloads/viewcat.php?cid=7
stusti.patrick-bernau.de/modules/mylinks/viewcat.php?cid=1
www.cpmdq.com/modules/mylinks/viewcat.php?cid=11
shaksha.ru/modules/bamagalerie3/viewcat.php?cid=15
www.assisi.sk/modules/mylinks/viewcat.php?cid=2
www.ideabyidea.com/main/modules/mylinks/viewcat.php?cid=10
www.starwars.alfaspace.net/modules/mydownloads/viewcat.php?cid=7
www.alssrhan.com/modules/mysections/viewcat.php?cid=1
yaoigames.ru/tenma/modules/mydownloads/viewcat.php?cid=5
sitefree.ru/modules/mydownloads/viewcat.php?cid=15
www.lg-talks.ru/portal/modules/files/viewcat.php
egpic.6te.net/modules/bamagalerie3/viewcat.php?id=11
licey.pushkino.tv/modules/mydownloads/viewcat.php?cid=1
aor3d.best-host.ru/modules/mydownloads/viewcat.php?cid=2
3gpvideo.ru/modules/files/viewcat.php?cid=3
atom.alfaspace.net/modules/mydownloads/viewcat.php?cid=1
www.agifish.com.vn/home_en/modules/photo/viewcat.php?cid=1
|

matches [

# 57 results @ 2010-07-11
{ :ghdb=>'"powered by RunCMS" -Vulnerability -exploit inurl:module inurl:viewcat.php' },

]

def passive
        m=[]

        if @body =~ /<div align='center'><a href='http:\/\/www.runcms.org\/' target='_blank'> Powered by  RunCms [\d\.a-z]+[\ Secured]* &copy; [\d]{4}-[\d]{4} /
                version=@body.scan(/<div align='center'><a href='http:\/\/www.runcms.org\/' target='_blank'> Powered by  RunCms ([\d\.a-z]+)[\ Secured]* &copy; [\d]{4}-[\d]{4} /)[0][0]
                m << {:version=>version}
        end

        if @body =~ /<meta name="generator" content="[\ ]*RUNCMS [\d\.a-z]+[\ Secured]*/i
                version=@body.scan(/<meta name="generator" content="[\ ]*RUNCMS ([\d\.a-z]+)[\ Secured]*/i)[0][0]
                m << {:version=>version}
        end

        m

end


end

