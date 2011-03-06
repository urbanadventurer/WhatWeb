##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Fixed regex
##
Plugin.define "PHP-Link-Directory" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13 
version "0.2"
description "phpLD is the most widely used directory script on the internet, installed on over 100,000 websites. phpLD is a great addition to any site, and is easy to install. - homepage: http://www.phplinkdirectory.com/"

# 186 results for "powered by phpLinkDirectory" @ 2010-08-07
examples %w|
www.inclusio.com
pornocms.com
www.londovor.com
www.travel247365.com
myworlddirectory.com
www.ultradirectory.net
www.link-collections.info
www.summerdirectory.info
www.dawnlink.info
www.knifedirectory.info
shrateralliance.com
www.gardenwebdirectory.com
highriselinks.info
www.drinksdirectory.info
www.hitchfifty.com
www.hitslive.info
indian-links.com
www.addmylinkfree.com
www.vipdirectory.com.ar
www.europelink.info
|

matches [

# Powered by text
{ :ghdb=>'"powered by phpLinkDirectory"', :certainty=>25 },
{ :regexp=>/<a href="http:\/\/www.phplinkdirectory.com[^>]*Phplinkdirectory/i },

# Version detection # Meta generator
{ :version=>/<meta name="generator"[^>]*content="PHP Link Directory ([0-9\.]+)"/ },

]

end

