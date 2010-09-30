##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Linksys-Wireless-G-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "Linksys Wireless-G Camera web interface - homepage: http://www.linksys.com/"

# 40 Google results for inurl:/img/vr.htm @ 2010-07-20
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1591
examples %w|
80.59.92.31:1024/img/vr.htm
66.91.132.178/img/vr.htm
85.126.1.68/img/vr.htm
71.110.74.185:1028/img/vr.htm
217.41.61.33/img/vr.htm
www.peteandsheree.com/img/vr.htm
83.238.214.157:1048/img/vr.htm
82.236.10.129:1024/img/vr.htm
70.148.193.61/img/vr.htm
216.24.116.214:8080/img/vr.htm
gasnetlabs.com:1024/img/vr.htm
65.122.13.135:1024/img/vr.htm
213.211.35.82/img/vr.htm
76.119.200.119:1024/img/vr.htm
majocam.dyndns.org:8000/img/vr.htm
lambcam.southstaffs.ac.uk/img/vr.htm
scaad.dnsalias.com:1024/img/vr.htm
demajo.net:6666/img/vr.htm
92.254.58.152/img/vr.htm
lemmel2.serveftp.com:1213/img/vr.htm
hogweed.homedns.org:5003/img/vr.htm
remepatrice.mine.nu/img/vr.htm
81.149.165.158/img/vr.htm
131.238.220.251/img/vr.htm
masip.no-ip.info:1025/img/vr.htm
potterproductions.dnsalias.net:1024/img/vr.htm
netanyaparacam.hobby-site.org:1024/img/vr.htm
pleasantgrovefarm.org:47450/img/vr.htm
koraycam.homeip.net:1024/img/vr.htm
horberg.dyndns.biz:1027/img/vr.htm
bildung.model.poltava.ua/img/vr.htm
|

matches [

{ :text=>'<title>Linksys Wireless-G Internet-Videokamera</title>' },

{ :text=>'<title>Linksys Wireless-G Internet Video Camera</title>' },

{ :text=>'<body bgcolor="#ffffff" marginheight="0" marginwidth="0" leftmargin="0" topmargin="0" onload="parent.chkRefresh(\'vr\')"> </body>' },

]


end

