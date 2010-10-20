##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex
##
Plugin.define "php-ping" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13
version "0.2"
description "php-ping - PHP powered ping web interface."

# About 184 results for "Enter ip" inurl:"php-ping.php" @ 2010-06-13
examples %w|
www.help4web.net/network/php-ping.php
hostpit.com/tools/php-ping.php
info.wizbiz.net.nz/php-ping.php
www.montreal514.net/scripts/php-ping.php
68.185.2.151/website/Ping/php-ping.php
arrmix.com/test/php-ping.php
azerz.homeip.net/php-ping.php
www.ipscan.info/php-ping.php
www.ipcrawl.com/php-ping.php
217.26.128.10/ping/php-ping.php
www.indirizzoip.net/php-ping.php
users.ipnet.hu/cateye/who/php-ping.php
www.weas.co.cc/system/ping/php-ping.php
mano.ra2.lt/www/tinklas/php-ping/php-ping.php
gspro2k.com/tools/php-ping.php
research.dfci.harvard.edu/php-ping.php
209.91.185.71/scripts/php-ping.php
netutils.hardnet.ro/php-ping.php
www.paktel.net.id/~hanggoro/nettool/ping/php-ping.php
speedtest.trueinternet.co.th/speedtest/php-ping.php
www.didc.lbl.gov/secret/php-ping.php
|

matches [

# GHDB Match
{ :ghdb=>'"Enter ip" inurl:"php-ping.php"', :certainty=>75 },

# Default form HTML
{ :regexp=>/<form methode="post" action="[^>]*>[\s]*Enter IP or Host[^<]*<[^<]*type="text" name="host" value="[\d\.]*"><\/input>[\s]*Enter Count[^>]*name="count" size="2" value="4"><\/input>[^>]*[\s]*<input type="submit"[^>]*name="submit" value="Ping!"><\/input><\/form><br><b><\/b>/ },

]

end

