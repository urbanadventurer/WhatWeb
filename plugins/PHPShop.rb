##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHPShop" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-26
version "0.1"
description "PHPShop - A shopping cart application. Documentation, download, demo, and forums are provided. (PHP,MySQL) - Homepage: http://code.google.com/p/phpshop/"

# Google results as at 2011-02-26 #
# 243 for powered by PHPShop"

# Examples #
examples %w|
https://eagle.hostrack.com/perrisrecords.com/catalog/
skyf.co.za
bunyilcollection.com
203.109.148.137
mostalzamat.com
demos.softaculous.com/phpShop/
demo.favoururl.com/phpshop/
demo.favoururl.com/phpshop/
paintdebpaint.com/phpshop/
microssix.com
sequincasual.com
matthieu.bruant.free.fr/phpshop_0.8/htdocs/
www.syptesting.com/phpshop/
www.degree-celsius.com
www.sequinhifashions.net
www.nspetfood.com
www.modelcraftsandhobbies.co.nz
www.prahabike.cz/phpshop/
www.ezyphotoshare.com/phpshop/
www.klownkampf.com/phpshop-0.8.1/
www.predictablyrandom.ca
www.clockhouse.biz/phpshop/
www.silvergold-coin.com
www.murphyporscheparts.com/store/
www.groosir.com
www.predictablyrandom.ca
www.perrisrecords.com/catalog/
www.seolinkr.pl
www.handhgreekaccents.com
www.ninja-monkey.com/shop/
www.elenisfavors.com
www.spiritcharmed.com
www.celestialrealms.net/boutique/
www.chmp-kenya.org/phpshop/
|

# Matches #
matches [

# GHDB Match
{ :certainty=>25, :regexp=>/Powered by phpShop/i },

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/www.phpshop.org"[^>]*>phpShop<\/a>/i },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.phpshop.org"[^>]*>phpShop<\/a>[\r\n\s]+([\d\.]+) / },

]

end


