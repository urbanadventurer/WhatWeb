##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ipTIME-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-19
version "0.1"
description "ipTIME Rrouter [Korean] - developed by EFM Networks - Homepage: http://www.iptime.co.kr/~iptime/prd.php?pf=3"

# Google results as at 2011-03-19 #
# 103 for intitle:"EFM Networks ipTIME" +Version

# Examples #
examples %w|
test.iptime.org:1234
211.231.9.135
ftw.co.kr/login/login.cgi
sicoxp.dyndns.org:5537
usik.dyndns.org:8080
epicpoem.dyndns.org:6410
sicoxp.dyndns.org:5537/login/login.cgi
ifwind.homeip.net:8080
kylish.homeip.net:4677
pakcw.homeip.net:3000
124.53.159.169
corea.co.cc
hyeonchang.com:8888
sayfeeling.com/login/login.cgi
acidist.iptime.org:99
noti.iptime.org:3249
dclick23.iptime.org:3000
www.studioplanar.com:100/login/login.cgi
usaber.net:8000
119.204.95.164:8888
dmas.dyndns-ip.com:254/login/login.cgi
119.202.51.13
210.107.194.151
charles.co.kr
www.pulum.me:3000
121.132.143.195:8080
183.96.89.57:8080
59.7.31.55:8080
110.47.168.45
122.38.104.3:9186
121.186.2.116
greg.homeftp.org
suny.getmyip.com:11/login/login.cgi
122.36.104.147
122.36.104.147
webkebi.kjsrchurch.org:8080
www.jeremiah.co.kr:8000
lys.lecl.net:88
kkattakkura.netorage.com
kdh.selfip.net:6060
61.4.213.45:8080
foryou.homeip.net
gaggi93.serveftp.com:8888/login/login.cgi
kimcola.wo.tc
leokomodo.mine.nu:8080
yhs6119.canu.co.kr
kbell.co.kr:8000
webhard.kdml.co.kr:8080
happy.hu.co.kr
|

# Matches #
matches [

# Model Detection # Title
{ :model=>/<head><title>EFM Networks ipTIME ([A-Z0-9]+)<\/title>/ },
{ :model=>/<head><title>EFM networks - ipTIME ([A-Z0-9]+)<\/title>/ },

# IP Detection
{ :url=>"/login/login.cgi", :string=>/([\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3})<\/span><br>[\s]*<span class=item_text><b>Version [\d\.]+<\/b><\/span>/ },

# Firmware Detection
{ :url=>"/login/login.cgi", :firmware=>/(No IP|[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3})<\/span><br>[\s]*<span class=item_text><b>(F\/W )?Version ([\d\.]+)<\/b><\/span>/, :offset=>2 },

]

end


