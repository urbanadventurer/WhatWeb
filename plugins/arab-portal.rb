##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated version detection and regex
##
Plugin.define "Arab-Portal" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-25
version "0.2"
description "Arab-Portal"

# 308 results for "powered by Arab Portal" -exploit @ 2010-07-25
examples %w|
www.2dab.org
achwa9.0fees.net
alksr.net/blog/
allkarbabad.com
almasder.net/newsiraq/
alsakr.eb2a.com
alshafafeyabh.org
antismoke.arabvolunteering.org
bingeh.com
bpc4s.com/portal/
downaif.com
eshrfynb.com
etsabya.com
fabcc.net
farashin.100webspace.net
hadatha4syria.org
m7m7.org
moltaqa-altaakhi.com
moufatticha.net
muhammadway.net
news.radiobethlehem2000.net
orthor.net
iofss.net
tantauni.p2h.info
watanews.com
www.abhaclub.net
www.al-br.org
namasgedu.gov.sa
www.alhoudoude.com
www.aljamahier.com
www.aljubran.org
www.alkharjedugirls.gov.sa/arab/
www.almotawef.com
www.almusawi.org
www.al-ostath.com
www.alqattan1.com/home/
www.alsulaiteen.com
www.alyoom.net
www.arabianawareness.com
www.arabiaone.org
www.arab-portal.info
www.arabvolunteering.org
www.asgp.org.au
www.ashola.com
www.baladna.org/portal/
www.benscouts.com
www.bingeh.com
www.binsaadi.com
www.bishaclub.com
www.bscr.ps
www.dmc-it.net
www.dr-alhaifi.com/doctor/
www.dyriah.com
www.eskansitra.net/ar/
www.faisalbughdadi.com
www.falconsco.com/en/
www.freih.com
www.hadaf-hr.com/arabic/
www.healthyoverunhealthy.com/mag/
www.hewayat.net
www.hjschools.net
www.iraq-amsi.com/Portal/
www.iraqml.com
www.jazanhealth.gov.sa
www.klmaa.com
www.ksu-pt.com
www.lalishduhok.com/news/
www.m7m7.org
arab-portal.net
www.masafatt.com
www.menber-alhewar1.org
www.mge.gov.sa/portal/
www.natourcenter.com/web/
www.nunchaku.ps/portal/
www.pms.edu.sa
www.p-yemen.com/dlil/
www.qaryout-ch.com/site/
sohofe.com
www.salam-tv.ps
www.saleh2009.com
www.saudifit.com
www.saudiinnewcastle.net
www.saudistat.net
www.sdonet.gov.om
www.sena3a.com/portal/
www.shatej.com
www.shia.com.au
www.2dab.org
www.hassanalbanna.org
www.tantauni.p2h.info
www.tasafaina.com/index/
www.thab7toona.org
www.urrnina.com
www.viibh.org
www.wasitonline.com
www.wasitpc.gov.iq
arabsd.com
jawatha.edu.sa
|

matches [

# Meta copyright
{ :regexp=>/<META NAME="COPYRIGHT" CONTENT="Copyright[^\>]*by Arab[\s]*Portal"/ },

# Version detection # Meta Copyright
{ :version=>/<META content="[^>]*Powered by: Arab Portal v([\d\.]+), Copyright[^>]*" name="description">/ },

# Version detection # Powered by text
{ :version=>/<center><font size=2>Powered by: Arab[\s]*Portal v([\d\.]+)[\s]*, Copyright/ },

]

end

