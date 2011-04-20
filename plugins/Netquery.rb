##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Netquery" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-20
version "0.1"
description "Netquery is a complete PHP/SQL open-source toolkit of network utilities. Available as a standalone application and as a module for the following CMSs: e107, PHP-Fusion, Xaraya, Xoops and Zikula. - Homepage: http://virtech.org/tools/"

# 89 results for inurl:"nquser.php" filetype:php -inurl

# Dorks #
dorks [
'inurl:"nquser.php" filetype:php -inurl'
]

# Examples #
examples %w|
virtech.org/e107/e107_plugins/netquery/nquser.php
e107.virtech.org/e107_plugins/netquery/nquser.php
howtointernet.net/netquery/nquser.php
mysiteisdown.com/tools/netquery/nquser.php
www.falkenbjerg.dk/infusions/netquery/nquser.php
www.myfuyoo.com/v7/infusions/netquery/nquser.php
www.digdns.net/netquery/nquser.php
www.dnsinspector.com/nquser.php
www.vstore.ca/free-ip-dns-tools/nquser.php
www.learnmyip.com/nquser.php
www.networkquery.com/nquser.php
basisten.se/e107_plugins/netquery/nquser.php
www.riverdaughter.com/scripts/webroot/netquery/nquser.php
174.132.190.156/~virtvir5/fusion/infusions/netquery/nquser.php
174.132.190.156/~virtvir5/e107/e107_plugins/netquery/nquser.php
emailexpert.org/netquery/nquser.php
www.muscapaul.com/infusions/netquery/nquser.php
95.104.113.55/plugins/netquery/nquser.php
www.recon.uni.cc/infusions/netquery/nquser.php
www.thehelppage.com/netquery/nquser.php
www.rvirtue.net/e107/e107_plugins/netquery/nquser.php
www.danpopp.net/netquery/nquser.php
finnher.no/e107_plugins/netquery/nquser.php
the-irc.com/dnstools/nquser.php
www.freednslookup.net/dns/nquser.php
www.network-tools.in/nquser.php
gator734.hostgator.com/~virtvir5/fusion/infusions/netquery/nquser.php
www.reasoninfo.net/netquery/nquser.php
www.pinghack.com/nquser.php
web-ro.net/infusions/netquery/nquser.php
www.frontlinelk.com/netquery/nquser.php
network.bilgisayar.com/nquser.php
www.holgeriaans.nl/infusions/netquery/nquser.php
www.netsetup.it/netquery/nquser.php
www.ns-wordpress.pl/infusions/netquery/nquser.php
seudoip.com/rastrea/nquser.php
izmirartcoretattoo.com/e107_plugins/netquery/nquser.php
safonov.tv/portal/e107_plugins/netquery/nquser.php
www.iqforum.nl/plugins/netquery/nquser.php
www.macsn.de/infusions/netquery/nquser.php
koreanservers.com/nquser.php
www.swiss-sl.ch/infusions/netquery/nquser.php
willi.wangert.net/infusions/netquery/nquser.php
www.brevdueklubbeneioslo.no/infusions/netquery/nquser.php
www.lindbergduene.no/gouldsamadiner/infusions/netquery/nquser.php
www.evnanos.phorum.cz/e107_plugins/netquery/nquser.php
www.cmhacks.com/netquery/nquser.php
www.gopagerank.com/net-query-tools/nquser.php
www.smrn.com/tools/nquser.php
www.iaweb.biz/netquery/nquser.php
tools.xevolution.ro/nquser.php
www.dhart.de/nq/nquser.php
www.nxtek.com/hosting/netquery/nquser.php
www.startnet.be/wrapper/netquery/nquser.php
|

# Matches #
matches [

# Default form
{ :text=>'<form class="nquser" action="nquser.php" method="post">' },

# Default link + img class
{ :text=>'<a href="nquser.php?querytype=countries"><img class="gobuttonup"' },

# legend tag
{ :certainty=>75, :text=>'<legend>NQ User Interface</legend>' },

# Top countries link
{ :certainty=>75, :text=>'<br /><a href="nquser.php?formtype=countries">Top Countries' },

# Admin link
{ :text=>'<a href="nqadmin.php"><img class="gobutton" src="images/btn_adm.gif" alt="Administration" /></a>' },

# Error # Could not retrieve Netquery configuration data from the database.
{ :md5=>"24a75ccc492b5a9118a4d226c25895c1" },

]

end


