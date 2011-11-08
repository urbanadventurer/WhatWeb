##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Centreon" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-09
version "0.1"
description "Centreon is a network, system, applicative supervision and monitoring tool, it is based upon Nagios. - Homepage: http://www.centreon.com/"

# Google results as at 2011-11-11 #
# 50 for intitle:"Centreon - IT & Network Monitoring" "Centreon Logo"
#  4 for inurl:"centreon/main.php"

# Dorks #
dorks [
'intitle:"Centreon - IT & Network Monitoring" "Centreon Logo"'
]

# Examples #
examples %w|
78.46.20.12:8148/centreon/
mc.citytelecom.ru/centreon/
iris.skytel.com.ph/centreon/
demo.centreon.com/centreon/
clemsbbq.com/centreon/
nagios.dabltech.co.il/centreon/
www.tuobra.es
nagiosmla.redirectme.net/centreon/
anthoine.org
monitor1.pinetecltd.net
88.198.44.231
www.tecnomater.com
nagios.ping247.de
nsblack.bilink.com.br
nagios.grepnet.cz/centreon/
monitor.idkin.com/centreon/
www.padilla.cl
support.anil-is.fr
demo.dohled.eu/centreon/
ns2.flirtomatic.net
fan-demo.gezen.fr/centreon/
willay-cajamarca.dyndns.org/centreon/
tier2-nagios.na.infn.it/centreon/
skolelinux.hurum.kommune.no/centreon/
neon.absystech.net/centreon/
webmail.atentus.cl
0440000a.nagedu.org/centreon/
monitor2.tudelft.nl
touchhpc.sytes.net:3102/centreon/
91.211.113.3/centreon/
finton.homedns.org/centreon/
peronet.net/centreon/
ec2-174-129-26-232.compute-1.amazonaws.com
www.electricos.alv.cl
www.dolisos.boiron.fr
mc.citytelecom.ru/centreon/
https://nas.halman.net/centreon/
https://system.sanbi.ac.za/centreon/
centreon-in.bsky.net/centreon/
zimbra.leftclick.co.uk/centreon/
filter.olileo.net/centreon/
https://monitoring.reist-tele.com/centreon/
https://monitor.cyberlogic.net/centreon/
https://omc.selecom.fr/centreon/
https://dohled.kshelp.cz/centreon/
https://195.101.162.163/centreon/
https://nag-pg.bsky.net/centreon/
https://secure.warecorp.com/centreon/
https://nagios.limonetik.com/centreon/
|

# Matches #
matches [

# Login Page # Year Detection # Meta Generator
{ :string=>/<meta name="Generator" content="Centreon - Copyright \(C\) 2005 - (20[\d]{2}) Open Source Matters\. All rights reserved\." \/>/ },

# Login Page # Year Detection # td id="LoginInvitcpy"
{ :string=>/<td id="LoginInvitcpy" colspan="2"><br \/>&copy; 2005-(20[\d]{2}) <a href="mailto:infos@centreon\.com">Centreon<\/a><\/td>/ },

# Login Page # Logo HTML
{ :text=>'<td class="LoginInvitLogo" colspan="2"><img src="img/centreon.gif" alt="Centreon Logo" title="Centreon Logo" style="" /></td>' },

# Login Page # Version Detection
{ :version=>/<tr>[\s]+<td class="LoginInvitVersion"><br \/>[\s]+([^\s^<]+)[\s]+<\/td>[\s]+<td class="LoginInvitDate"><br \/>/ },

]

end

