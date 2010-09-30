##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "cpCommerce" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.1"
description "Web shopping cart - homepage: http://cpcommerce.org/"

# 58 results for "powered by cpCommerce" @ 2010-08-14
examples %w|
cphnetwork.com
blackpearlgoddess.com
www.grsrefrigeration.com
www.myhomecinema.be/shop/
www.medtechforensics.com/store/
www.rc-auto.hu
www.swordsandstarships.com
phpcat.com/BPG/document.php
onlytechdeals.com
www.rhonakonrad.com/gallery/
juicysoulja.com/shop/
www.logictechs.com/LCTstore/
store.davidburren.com
greeneysgarage.com
www.therecordfinder.com.au/store/
www.klimperbein.de/shop/
abckonyvek.hu/v1.3.0/cpcommerce/
www.publimania.com.ar
www.elrastromotorrad.com
|

matches [

{ :text=>'        Powered by cpCommerce' },
{ :text=>'    <title>cpCommerce by Matthew Wilkin</title>' },
{ :text=>'Powered by <a href="http://cpcommerce.cpradio.org/" target="_blank">cpCommerce</a>.' },
{ :text=>'Powered by <a href="http://cpcommerce.org/" target="_blank">cpCommerce</a>.' },

]

end

