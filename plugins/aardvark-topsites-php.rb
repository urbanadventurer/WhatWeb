##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex and version detection
##
Plugin.define "Aardvark-Topsites-PHP" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-26
version "0.2"
description "Aardvark Topsites PHP is a free topsites script built on PHP and MySQL. - homepage: http://www.aardvarktopsitesphp.com/topsites/"

# About 330,000 results for "Powered by Aardvark Topsites PHP" @ 2010-06-26
examples %w|
www.aardvarktopsitesphp.com/topsites/
toptopsites.com
cpc-live.com/topsites/
zzos.com
montani.org
gold-agents.net
iphonebuyers.info
topvisibility.com
topsites.sikhmates.com
tesolmax.com/topsites/
www.habbotopsites.com
scrapswithattitude.com/topsite/
scrapbooksgonedigital.com/TOPSITES/
pixeladlist.net
cybergamezone.com/topsites/
vivifyu.com
seebc.ca
www.entertainmentauctions.info
bathandbodytopsites.com
2142topsites.com
dutchpony.data-service.nl/toplist/
herpcaretopsites.com
pinoytopsites.org
stargatetopsites.com
armatopsites.com
100desitopsites.com
dodtopsites.com
rankhere.com
twilightlinks.com
joomlapoweredsites.com
csntopsites.org
g-phonetopsites.com
www.politicaltopsites.com
www.bluetreeproxy.com
www.mes-english.com/topsites/
hot-wii-sites.com
aionlist.net
rickyswebtemplates.com/topsitesphp-4.2.1/
houseofnight-topsites.com/
zensfer.blogspot.com
radiotopsites.co.uk
khmerclub.org
topsitegeo.com
batmantopsites.com
topsites.watchanimeon.com
etop20.com
footyall.com
avptop100.com
topsites.fgn-guild.com
phpbb-topsites.com
africantopsites.com
topsites.technoized.com/megaman/
maximiliangenealogy.com/toplist/
iranksites.com
ffinsider.net/topsites/
getmetraffic.com/topsites/
pornphone.com/iphonepornsites/
top-adult.eu
topsites.girls-teasing.com
www.phonesextoplist.com
|

matches [

# GHDB Match
{ :ghdb=>'"Powered by Aardvark Topsites PHP"' },

# Default powered by text
{ :regexp=>/Powered by <a href="http:\/\/www.aardvarktopsitesphp.com[^>]*>[^A]*Aardvark Topsites PHP/i },

# Version detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.aardvarktopsitesphp.com\/"><b>Aardvark Topsites PHP<\/b><\/a> ([\d\.]+)/ },
{ :version=>/Powered by <a href="http:\/\/www.aardvarkind.com\/">Aardvark Topsites PHP<\/a> ([\d\.]+)/ },

]

end

