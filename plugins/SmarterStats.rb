##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SmarterStats" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Complete SEO and Web Analytics for Individuals and Enterprises - Homepage: http://www.smartertools.com/smarterstats/web-analytics-seo-software.aspx"

# Google results as at 2011-03-13 #
# 87 for intitle:"Login - SmarterStats" "Login to SmarterStats"

# Examples #
examples %w|
www.sitenumbers.com
webstats.i4.net.au
stats.idesignsite.com
www.bexstats.com
www.getmystats.com.au/smartstats/
stats.seedtechnologies.com
stats.thewebguys.com
stat.totalcom.info
www.1stopnetworks.bm:9999
75.126.255.25
stats.crimanet.ch
stats.etharius.com
stats.tistar.ch
backupnow.se:9999
statistik.easywww.nu
stats-ss.orcsweb.com
stats.waynehiatt.net
stats.idmi.net
stat.fastname.no
stats.hostnj.net
www.norandexrebuild.com
www.fogaszatiszakertok.fogorvos.com
webreports.electronet.net
smarterstats.networkdns.biz
https://stats.sphere-hosting.com
smarterstats.sushiseven.com
75.126.141.157
stats.w2m.co.uk/default.aspx
www.rallydaamazonia.com.br
smarterstats.aquesthosting.com
stats.wpa.com.au
stats.valuetronics.com
stats.rocket455.com
stats.microsoluciones.net
217.162.0.154/default.aspx
srvstat.se
intern.trucktrade.de
stats.a-tech.com
stats.socialistworker.co.uk
ns4.servwise.com
stats.win-dns.com
stats.porta80.com.br
webstats.freedom2surf.net/stats/login.aspx
www.diy.fogorvos.hu
stats.ezwaysolutions.com
ss01.discountasp.net
digitalbackups.com:9999
statistics.bilberrydesign.co.uk
smarterstats.liquidsix.co.uk
66.252.234.63
stats.onesmarthost.co.uk
stats.onmanage.com
stats.instinct.qc.ca
stats.xirflow.com
stats.lighthouseuk.net
webstats.salt.na
pagabarato.com
stat.mec-gr.eu
www.nrgdock.com
statistik.wsk.nu
mytunbridgewells.com
stats.loafintree.com
stats.gfxinternetservices.com
stats.xaak.net
phxstats.com
174.37.34.81-static.reverse.softlayer.com
www.webwizeinc.com/smarterstats/
stats.ottawahosting.com
ftp.applieddesignsolutions.com
stats.jelecos.com
stats.fpweb.net
64.58.157.15
activecycles.com.au/Login.aspx
statistik.time.dk
stats.g2k.it
https://onstat.oevermann.de
www.domainhost.hu/stat/login.aspx
smartwin001.aruba.it
smartwin003.aruba.it
stats.newtechwebservices.com
webstats.npce.com
stats.castors.ch
stats.capitalserv.net
smarterstats.tropicalblinds.com
stats.lunahost.com
|

# Matches #
matches [

# Product Detection # Vendor Link # >= 5.x
{ :string=>/<a href='http:\/\/www.smartertools.com\/smarterstats\/web-analytics-seo-software.aspx' target='_blank'>SmarterStats (Enterprise|Professional|Free) ([\d\.]+)<\/a>( |&nbsp;)\|( |&nbsp;)<a href='http:\/\/www.smartertools.com\/smarterstats\/web-analytics-seo-software.aspx' target='_blank'>Web Log Analytics( & SEO Software)?<\/a>/ },

# Verson Detection # Vendor Link # >= 5.x
{ :version=>/<a href='http:\/\/www.smartertools.com\/smarterstats\/web-analytics-seo-software.aspx' target='_blank'>SmarterStats (Enterprise|Professional|Free) ([\d\.]+)<\/a>( |&nbsp;)\|( |&nbsp;)<a href='http:\/\/www.smartertools.com\/smarterstats\/web-analytics-seo-software.aspx' target='_blank'>Web Log Analytics( & SEO Software)?<\/a>/, :offset=>1 },

# Product Detection # Vendor Link # 4.x
{ :string=>/<a href='http:\/\/www.smartertools.com\/Products\/SmarterStats\/Overview.aspx' target='_blank'>SmarterStats (Enterprise|Professional|Free) ([\d\.]+)<\/a>&nbsp;\|&nbsp;<a href='http:\/\/www.smartertools.com\/' target='_blank'>Windows Web Analytics<\/a>/ },

# Verson Detection # Vendor Link # 4.x
{ :version=>/<a href='http:\/\/www.smartertools.com\/Products\/SmarterStats\/Overview.aspx' target='_blank'>SmarterStats (Enterprise|Professional|Free) ([\d\.]+)<\/a>&nbsp;\|&nbsp;<a href='http:\/\/www.smartertools.com\/' target='_blank'>Windows Web Analytics<\/a>/, :offset=>1 },

# Product Detection # td bar1inner # 3.x
{ :string=>/										<td class=bar1inner>SmarterStats (Enterprise|Professional|Free|FREE) Edition ([\d\.]+)<\/td>/ },

# Version Detection # td bar1inner # 3.x
{ :version=>/										<td class=bar1inner>SmarterStats (Enterprise|Professional|Free|FREE) Edition ([\d\.]+)<\/td>/, :offset=>1 },

# Title
{ :text=>"<title>Login - SmarterStats</title>" },

]

end


