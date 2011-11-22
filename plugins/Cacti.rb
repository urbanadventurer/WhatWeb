##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cacti" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "Cacti is a complete network graphing solution designed to harness the power of RRDTool's data storage and graphing functionality. - Homepage: http://www.cacti.net/"

# Google results as at 2011-11-22 #
# 86 for inurl:"cacti/graph_view.php?action="
# 49 for "Please enter your Cacti user name and password below:" intitle:"Login to Cacti"

# Dorks #
dorks [
'inurl:"cacti/graph_view.php?action="'
]

# Examples #
examples %w|
https://wiki.cse.buffalo.edu/cacti/
https://cacti.bath.ac.uk/cacti/
mrtg181.eastern-tele.com
support.airspeed.ie
www.env.msu.ac.th/cacti/
traffic.012.net.il
cacti.esn.ac.lk
163.22.4.155/cacti/
193.255.152.57/cacti/
bellspace.net/cacti/
cacti.bath.ac.uk/cacti/
cacti.orion.on.ca/cacti/
devar.dyndns.org/cacti/
ersh.tog.ru/cacti/
gargamel.merlins.org/cacti/
gilks.ath.cx/cacti/
https://ciist.ist.utl.pt/cacti/
https://monitor.waia.asn.au/cacti/
https://www.jaqpot.net/cacti/
lyra.nexusuk.org/cacti/
mae.nmsu.edu/cacti/
monitor.net.tenet.ac.za/cacti/
mon.ugm.ac.id/cacti/
nagios.creativecommons.org/cacti/
netmon.acad.bg/cacti/
netmon.lru.ac.th/cacti/
netmon.rmutsv.ac.th/cacti/
perfsonar.cen.ct.gov/toolkit/gui/cacti/
serveurperso.ath.cx/cacti/
status.pulpfree.org/cacti/
tibu.kiisu.eu/cacti/
umopt1.grid.umich.edu/cacti/
unix1.gps.caltech.edu/cacti/
www.billiau.net/cacti/
www.ir3ip.net/cacti/
www.lab.bt.es/cacti/
www.libcice.net/cacti/
www.noc.cudi.edu.mx/cacti/
www.querx.com/cacti/
www.securedispatch.net/cacti/
www.vpntunnel.net/cacti/
www.x-graphs.com/cacti/
|

# Matches #
matches [

# Login Page # title
{ :text=>'<title>Login to Cacti</title>' },

# Login Page # body tag
{ :text=>'<body bgcolor="#FFFFFF" onload="document.login.login_username.focus()">' },

]

end

