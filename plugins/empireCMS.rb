##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Empire-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-04
version "0.1"
description "Open source CMS - homepage: http://www.phome.net/"

# 371 results for "powered by EmpireCMS" @ 2010-08-04
examples %w|
www.top-pwr.com
www.0000h.net
www.74aa.com
jsdwz.tk
www.jzbj.org
www.bf69.com
517fx.com
www.jhesx.com
www.skydiy.com
www.8e.cn
www.wannianchuan.com
www.baobaojd.com
520info.net
www.huolee.com
www.0439jx.com
www.gzsem.com
qcqh.net
www.tmdcc.com
95epay-payment.com
www.yx80.com
okjiankang.com
www.meiwo.com
www.56mb.com
www.nmgheli.com
www.fortunatelyfootball.com
www.xzen.net
www.v618.net
www.go2expo.com
www.vcbox.com
www.hmxm.net
www.andway.com
www.518wz.net
www.linuxexpress.com.cn
yymovie.net
www.doubiao.com
www.insip.com
23u.biz
www.jc12365.com
english.ygfsc.com
www.hd178.net
www.yananbtv.com
www.nedp.cn
www.dali163.com
www.gszh.com
www.hdyqf.com
www.mamahao.com.cn
www.5sousou.com
www.wuhuaccp.com
www.cbsrenshen.com
www.yiyixue.com
www.whcbd.org
uyg.xjhj.gov.cn
www.gogopzh.com
www.gszh.com
www.8e.cn
www.kmws.gov.cn
www.chess86.com
www.runningtiger.com.cn
tsg.yzms.cn
dl9.lib.tongji.edu.cn:8003
www.dqmbjy.org
www.csapa.org
www.mamahao.com.cn
www.media.sdu.edu.cn
www.rjzy2009.cn
www.artscbs.com
golftour.cgcl.com.cn
www.jc12365.com
www.dingniu8.com
medogo.com
|

matches [

{ :text=>' - Powered by EmpireCMS</title>' },

]

end

