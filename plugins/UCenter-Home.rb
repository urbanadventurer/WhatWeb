##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "UCenter-Home" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "homepage: http://u.discuz.net"

# 431 results for "powered by UCenter Home" @ 2010-10-12
# 89 results "powered by UCenter Home" inurl:.gov @ 2010-10-12
examples %w|
bbs.fy.gov.cn/home/
bbs.pingyao.gov.cn/myhome/space.php
bbs.pz.gov.cn/uchome/
bbs.scfda.gov.cn/home/
bbs.tz.gov.cn/uchome/
bbs.yichun.gov.cn/uchome/space.php
blog.12371.gov.cn
blog.cqyzfy.gov.cn
caofeidian.tsgaj.gov.cn/ucenter/home/space.php
club.jledu.gov.cn/home/space.php
club.xiangxiang.gov.cn/uchome/space.php
club.zzgxq.gov.cn/home/space.php
club.zzty.gov.cn/home/
djlt.gaogang.gov.cn/home/
face.talk853.com
fengrun.tsgaj.gov.cn/ucenter/home/space.php
gaoxin.tsgaj.gov.cn/ucenter/home/space.php
gov.icxo.com/space.php
kaixin.jyq.gov.cn/space.php
luannan.tsgaj.gov.cn/ucenter/home/space.php
luanxian.tsgaj.gov.cn/ucenter/home/space.php
my.jcys120.cn
pgmj.bjpg.gov.cn
portal.dsej.gov.mo/www/portalspace/uchome/uchome_c/
u.snwh.gov.cn/space.php
vpnbbs.snwh.gov.cn/bbs/uchome/space.php
yutian.tsgaj.gov.cn/ucenter/home/space.php
zgnx.gov.cn/home/space.php
zunhua.tsgaj.gov.cn/ucenter/home/space.php
www.chanchina.cn
www.ee23forum.net
www.on12e.net
www.otsuka-ai.cn
www.shengjueshi.com
www.webchina.net
www.dgagri.gov.cn/uhome/space.php
www.gaoyou.gov.cn/home/
www.hebly.gov.cn/lt/uchome/upload/space.php
www.hydzb.gov.cn/blog/space.php
www.jyq.gov.cn/bbs/home/space.php
www.lcly.gov.cn/bbs/home/
www.taihe.gov.cn/uchome/space.php
www.tsgaj.gov.cn/ucenter/home/space.php
www.zznews.gov.cn/home/space.php
|

matches [

# Default title
{ :text=>'Powered by UCenter Home</title>' },

# Version detection # Powered by text
{ :version=>/Powered by <a  href="http:\/\/u.discuz.net" target="_blank"><strong>UCenter Home<\/strong><\/a> <span title="[0-9]{8}">([\d\.]+)<\/span>/ },

]

end

