##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Esvon-Classifieds" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-13
version "0.1"
description "Intense research, development and testing has brought us to what we call Esvon Classifieds. This package is a good base for building a successful website and is created with high performance and scalable technology using PHP and MySQL. - homepage: http://www.esvon.com/pg/products/p_classifieds/"

# 90 results for "powered by Esvon Classifieds" @ 2010-09-13
examples %w|
allterrainshopper.com
classifiedusa.net
globalemploymentguide.com
photinicreations.com
qatarforall.com/auto/
top10contractors.com
worldsexguide.info/escorts/
www.custommarinesales.com/classifieds/
www.forsaleboats.com
www.holiday-home-rentals.com
www.ifreeagent.com
www.listarooni.com
www.nutrader.com
www.sunlifeproperty.com
www.thedieselclassifieds.com
www.worldsexguide.com/escorts/
www.usedbaby.ca
|

matches [

# HTML comment
{ :text=>'<!-- DO NOT REMOVE OR EDIT THIS LINE, DOING SO WILL RESULT IN COPYRIGHT VIOLATIONS UNLESS YOU PURCHASED "POWERED BY" REMOVAL OPTION -->' },

# Powered by text
{ :regexp=>/Powered by Esvon <a href='http:\/\/www.esvon.com\/pg\/products\/p_classifieds\/' target="_blank"[^>]+>Classifieds<\/a>/ },

]

end

