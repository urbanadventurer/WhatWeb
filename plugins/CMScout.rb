##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CMScout" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-22
version "0.1"
description "CMScout is a free and open-source CMS (Content management system) for Scouting related groups from around the world. A CMS is a piece of web software that makes it easy for you to install, and manage a website without needing to know any programming languages. - homepage: http://www.cmscout.co.za/"

# 93 results for "powered by CMScout" @ 2010-08-22
examples %w|
demo.opensourcecms.com/cmscout/index.php
thunderwolfdistrict.com
bsatroop959.com
troop60.110mb.com
bsatroop757.org
216.24.166.217
cspack106.com
bsatroop178.us
scouts.ballan.net.au
scout3.carahealy.com/index.php
great.pustral-ugm.org/index.php
troop1880.net
wahoopack140.com
troop136bsa.org
www.cmscout.co.za
www.strandscouts.org.za
www.1stditton.co.uk/cmscout/
www.9thirene.co.za
www.knoxgs.org
www.pack131.com/index.php
www.9thbenoniscouts.za.org/index.php
www.1stdursleyscouts.org.uk
www.lejeuneseacadets.org
www.7thbramshill.org.uk/index.php
www.pack372.org
www.central-notts-scouts.org.uk
www.fwsg.org.uk/index.php
www.6thlindsayscouts.ca/index.php
www.1stwestbury.org.uk
www.troop937.org
www.bsatroop915.com/index.php
www.troop1946.com/index.php
www.3rdbedford.co.uk
www.troop60.info
www.chms-scouting.org
www.gruposenderodesanpablo.org
www.airscouts.za.org
www.troop731.com
www.529gibraltar.org/troop/index.php
|

matches [

# Powered by text
{ :regexp=>/Powered by CMScout &copy;[\d\,]+ <a href="http:\/\/www.cmscout.za.net" title="CMScout Group" target="_blank">CMScout Group<\/a>/ },
{ :text=>'<!--Shows the CMScout and website copyright information. Please do not remove this without permission from the CMScout admin-->' },

]

end

