##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Fastpublish-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-03
version "0.1"
description "fastpublish CMS proudly presents the new Content Management System with the special features: easy to use and fast to publish. - Homepage: http://www.fastpublish.org"

# Google results as at 2011-03-03 #
# 51 for "Securitycode: (please insert the numbers from the picture into the following field)"

# Examples #
examples %w|
www.fastpublish.org
www.fastpublish.de
hilfe.fastpublish.de
www.cultureversy.com
www.taq-dna.com
www.bundesverband-patentanwaelte.de
www.numinabiodynamics.org
www.balkonvermietung.de
www.t-w-maria.de
www.showhownyc.com
www.thelivingtheatreworkshops.com
www.grassrootlandscaping.com
northshore.noizart.com
thelivingtheatreworkshops.noizart.com
www.advenco.de
www.youfact.com
isman.codie.com
www.codie.com
www.codie.eu
www.mingusart.com
www.dwornigkucki.de
www.charlesmingus3art.com
mingus.charlesmingus3art.com
www.komponistenforum.de
|

# Matches #
matches [

# favicon.ico
{ :url=>"favicon.ico", :md5=>"e95aa1d29e576c9ebdb08e0c5160cdfa" },

# Version Detection # Meta Generator
{ :version=>/<meta name="Generator" content="fastpublish CMS ([^"]{1,15})">/ },

]

end


