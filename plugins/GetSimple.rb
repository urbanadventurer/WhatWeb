##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-25 #
# Updated version detection
##
Plugin.define "GetSimple" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.2"
description "GetSimple is an open source CMS that utilizes the speed and convenience of XML, a best-in-class UI and the easiest learning curve of any simple Content Management System out there. - homepage: http://get-simple.info/"

# 389 results for "powered by getsimple Version" @ 2010-08-28

# Examples #
examples %w|
get-simple.info
demo.opensourcecms.com/getsimple/
demo.opensourcecms.com/getsimple/admin/
dcwds.com
www.mathematik.hu-berlin.de/~drapeau/
www.mircea.belcea.ro/GetSimple/
www.ahermosilla.com/getsimple/
www.divewebbgroup.com/internship/
www.1877junkpod.com
get.alenuda.pl
www.imajin.com.tr/get/
appremont.org.ua
dgcstudios.com/test/bsm/
james.schindler-ord.me.uk
clubs.psu.edu/up/astro/
www.calbeans.com
karsus.doctyoh.de/getsimple/
www.midrp.org
wangbuyi.limewebs.com/gs/
templates.hardblush.com
wasaam.org
www.kapitiplayhouse.co.nz
pvff.org/cms/
www.freemanpromotions.com
televisions.liberalunderground.ca
www.100184.com/simple/
systemsprojectmanagement.com
www.bunnyware.net
lim-scripts.bplaced.net
www.heathwblack.com
www.bydots.com
blues-school.com
healthylivingmassage.net
www.jandaltech.com
joynhensley.com
www.thejabulani.com
www.liquidsilver.eu
www.food-additive.info
sewsmooth.net/getsimple/
www.novenovestudio.com
trasformamente.altervista.org/consulta/
the835connection.com
www.accupage.com
www.mircea.belcea.ro/GetSimple/
harmoniousconceptstx.org/resources/
www.math.hu-berlin.de/~kupper/
liqueurs.police-k.com/bluecuracaoliqueur/
www.vlastina.cz
www.kennelsofasgard.com
tvleisure.junkboy.co.uk
dgcstudios.com/test/bsm/
www.libertygazette.com
www.stevemartineau.com
montydigital.com/flashCms/
getsimple.ru
www8.cs.umu.se/~c05jgn/exlog/
labh-curien.univ-st-etienne.fr/~combe/
zakopane.me
aai.murdoch.edu.au/projects/
perception.inrialpes.fr/~delaunoy/site/
www.math.hu-berlin.de/~kupper/
revision1.com/client/koa/
www8.cs.umu.se/~c05jgn/exlog/
ameonna.altervista.org/paloneromarker
www.mathematik.hu-berlin.de/~drapeau/
insraq.me/project/getsimple/
diabeticman.yaahosting.info
luckdesign.co.cc/getsimple/
yourdiabetes.phpzilla.net
winwin.net
www.jplprog.com/mrmratsen/
173.236.56.146/~vlastina/search
www.pugdogstudio.com
roadsideconcerts.com
|

# Matches #
matches [

	# Version Detection # Meta Generator
	{ :version=>/	<meta name="generator" content="GetSimple \- ([\d\.\_A-Z]+)" \/>/ },

	# Version Detection # Powered by text
	{ :version=>/<a href="http:\/\/get-simple.info\/" title="Open Source and Free CMS" >Powered by GetSimple<\/a> Version ([\d\.\_A-Z]+)/ },

	# Admin Page # Version Detection # Powered by text
	{ :version=>/<a href="http:\/\/get-simple.info\/">Powered by GetSimple<\/a> Version ([\d\.\_A-Z]+)/ },

]

end

