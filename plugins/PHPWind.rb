##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHPWind" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-18
version "0.1"
description "BBS [Chinese] - Homepage: http://www.phpwind.net/"

# Google results as at 2011-03-18 #
# 602 for "Powered by PHPWind"

# Examples #
examples %w|
www.phpwind.net/index.php
www.dreamkidland.cn/leadbbs/
fy22.com
shoujomaniac.free.fr/forum/index.php
www.agpr.net/bbs/simple/index.php
www.qmhistory.cn/read.php
www.zftrans.com/bbs/simple/index.php
bbs.crsky.com
www.nuaa-us.org/SF/bbs/read.php
www.mjjclub.com
bbs.drvsky.com/read.php
www.qtcn.org/bbs/read.php
bbs.bio668.com/simple/index.php
www.aliway.com
www.cjsidecarclub.com
bootspub.com
www.imysqler.com
tot.netai.net/read.php
jpra1113.org
www.legbar.net
www.richaide.com
tokyu-mall.com/bbs/read.php
www.gujianba.com/simple/
www.mion4you.com
www.sakura-yamashita.net
www.gsps.net
www.umc.tw/simple/
www.yifenai.com
ttg.im/bbs/ptredirect.php
homexue.com
www.25vc.com
www.sakuramai.com
www.thaidfilm.com/simple/
365yes.info/video/
www.bcjsw.com
www.fm58.com
www.567r.com
www.bigface.org
www.eqcn.org
bioqq.com
bbs.hebfanyi.com/simple/
www.gzw365.com
www.scholarships-forum.info
www.52bridge.com
vincentjunfans.zhemolove.net/bbs/
www.lcdwxw.com
www.50987.com
www.elxz.net
xyxgh.net
www.cnhonggu.com
www.lindaren.com
www.dqcun.net
58hhh.org
www.forex168.com
www.jaobao.com
www.565axa.com
www.qfywclub.com
www.iberzone.com
www.axsq.com
www.my0770.com
www.teesiam.com
www.redlinux.org
www.howtoec.com
www.xspio.com
www.519bar.com
hongse99.net
play.cs.land.to/read.php
www.faykerr.com
www.51ynet.com
starsea2010.net
www.kosaa.net
www.78do.net
www.19skycn.com
www.029fb.com
www.pmbar.net
www.52gaoping.com
newitfarmer.com
ourcax.com/caxbbs/index.php
hlbe.org
www.newzgjs.com
|

# Matches #
matches [

# Title
{ :certainty=>25, :regexp=>/<title>[^<]+ - (powered by phpwind.net|Powered by PHPWind)<\/title>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="PHPWind [v]?([^"^\(]+)(\([\d]+\))?" \/>/i },

# Powered by text
{ :text=>'Powered by <a href="http://www.phpwind.net/" target="_blank"><b>PHPWind</b></a>' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.phpwind.net\/" target="_blank"><b>PHPWind<\/b><\/a>[\s]*<a href="http:\/\/www.phpwind.net\/" target="_blank"><b style="color:#FF9900">v([\d\.]+)<\/b><\/a>/ },

]

end


