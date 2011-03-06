##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "Open-Blog" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
version "0.2"
description "Open blog is a free and open source blogging platform built using the CodeIgniter PHP framework and released under the GPL v3 license. - homepage: http://www.open-blog.info/"

# Google results for 2010-08-06 #
# 107 for "powered by Open blog"

# Examples #
examples %w|
www.open-blog.info/demo/
anfyjen.a.gp/blog/install/
secundaria1.sep.gob.mx/blog/install/
hristov.com/oblog/
jeffpatton.net
buyerofgold.com/blog/
www.basenlily.nl
www.sellton.com
www.t3cnologic.com/blog/
bluedolphinwalleye.com/openb/
noabsolutetruths.com
www.doctorxcv.com/xcv/blogs/
reusecode.net/blog/
sharemasterindia.com/blogs/
zerablog.co.cc/blog/
www.basenlily.me
redstreakhosting.com/blog/
cybercerebral.com
engrspk.com/openb/
pinoydigest.org
ajpower.info/OpenBlog/
www.davidberga.org/
web2nu.com/blog/
usednorstar4less.com
caradonnadive.com
steno.co.cc
peterro.se/blog/
dragoshsproducts.comunitateamea.com
www.dfwbankruptcy.net
www.internetdlafirm.com.pl
lovemyturtles.freehostingcloud.com/blog/
wangunyu.co.cc
batepronto.com/openbate/
etherealkingdom.com
www.infopc.tk
drakeman.info/indb/
www.internetbijbelcursus.nl/blog/
www.koszulki.depilacjalaserowa.net
blog.madmouseman.cz
diatekma.web.id
www.kimkiesel.de/brueckenstrasse/erftstadt/blog/
naim.nom.es/blog/
jaquemati.cz.cc
www.memyworld.es/shop/
www.adventure.waw.pl
www.imperium-ww.pl
izune.pl
www.klubtramwaj.pl
www.voip.sprzatanie-biur.com.pl
www.szkolenie.cinepix.com.pl
www.pozycjonowanie.sosnowiec.pl
iris.nom.es
jashk.netau.net
upsport.info
koleksipermai.com/openb/
evangelischdemocraten.nl
upsport.info
koleksipermai.com/openb/
dragoshsproducts.comunitateamea.com
|

# Matches #
matches [

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/www.open-blog.info[\/]*" target="_blank">Open Blog<\/a>/ },
{ :text=>'Powered by <a href="http://www.open-blog.info"' },
{ :text=>'    	Powered by <a href="http://www.open-blog.info" target="_blank">Open Blog</a>' },

# Version Detection # Install Page # Install Link
{ :version=>/			<a href="install.php">Install Open Blog<\/a> - choose this option, if you would like to install Open Blog ([\d\.]+)<br \/>/ },

]

end

