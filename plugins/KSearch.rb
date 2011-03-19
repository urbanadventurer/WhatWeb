##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "KSearch" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-20
version "0.1"
description "KSearch is the easiest website search engine to integrate, implement and use. KSearch is fully customizable - you can add or remove any features you want, without permission. KSearch is Open Source Software. - Homepage: http://www.kscripts.com/"

# Google results as at 2011-03-20 #
# 159 for "Powered by KSearch" inurl:ksearch.cgi filetype:cgi

# Examples #
examples %w|
www.osc.gov/cgi-bin/ksearch/ksearch.cgi
www.millingtontn.gov/cgi-bin/ksearch/ksearch.cgi
www.cbi.edu.cn/ksearch/ksearch.cgi
manzano.aps.edu/cgi-bin/ksearch/ksearch.cgi
www.3d-minigolf.at/cgi-bin/ksearch/minigolf/ksearch.cgi
www.tomorrownow.com/cgi-bin/ksearch/ksearch.cgi
www.icmart.org/cgi-bin/ksearch.cgi
www.co.santa-cruz.az.us/cgi-bin/ksearch/ksearch.cgi
www.valveaudio.co.za/cgi-bin/ksearch.cgi
academiesinc.org/cgi-bin/ksearch/ksearch.cgi
www.di-mgt.com.au/cgi-bin/ks/ksearch.cgi
c-y-m.org.uk/scripts/search/ksearch.cgi
crimsontechnology.com/search//ksearch.cgi
www.spiritofhouse.com/cgi-bin/ksearch/ksearch.cgi
elemental-ideas.co.uk/search/ksearch.cgi
bridportauctionhouse.com/search/ksearch.cgi
www.bikiniscience.com/cgi-bin/search/ksearch.cgi
www.kscripts.com/ksearch/ksearch.cgi
www.greenisp.net/search/ksearch.cgi
woodsta.org/cgi-bin/search/ksearch.cgi
www.scottishfamilyheritage.co.uk/cgi-bin/ksearch/ksearch.cgi
hrpartnering.co.uk/sitesearch/ksearch.cgi
www.waterfilings.com/cgi-bin/search/ksearch.cgi
markus-wyss.ch/suche/ksearch.cgi
www.catslot.com/cgi-bin/ksearch/ksearch.cgi
www.ebcu.co.uk/search/ksearch.cgi
www.aecleads.com/cgi-bin/ksearch1/ksearch.cgi
theawaitedone.com/search/ksearch.cgi
leprelong.co.uk/search/ksearch.cgi
www.optical-glass-filters.com/cgi-bin/search/ksearch.cgi
www.perandnik.com/cgi-bin/ksearch/ksearch.cgi
www.voidix.com/cgi-bin/search/ksearch.cgi
www.n-lightning.com/cgi-bin/ksearch/ksearch.cgi
www.internetmarketingterra.com/cgi-bin/search/ksearch.cgi
www.centennialantiques.com/cgi-bin/ksearch/ksearch.cgi
www.ias.ac.in/cgi-bin/pramana/ksearch/ksearch.cgi
www.aluminumnitride.com/cgi-bin/search/ksearch.cgi
www.i-n-c-o-m-e.com/ksearch/ksearch.cgi
napreca.net/ksearch/ksearch.cgi
www.marine-netguide.com/cgi-bin/ksearch/ksearch.cgi
www.olivia.com.au/cgi-bin/ksearch/ksearch.cgi
www.rechargebatteries.org/cgi-bin/ksearch.cgi
www.dpie.com/cgi-bin/ksearch.cgi
www.stainlesssteelsubstrates.com/cgi-bin/search/ksearch.cgi
www.cbrokers.net/cbrokerscgi/ksearch/ksearch.cgi
www.ultra-thin.com/cgi-bin/search/ksearch.cgi
www.buddyleejumpropes.com/cgi-bin/search/ksearch.cgi
www.farenhyt.com/cgi-bin/ksearch.cgi
www.picticon.com/cgi-bin/search/ksearch.cgi
www.puppytimeatlanta.com/puppytimeatlantacgi/ksearch/ksearch.cgi
firefish.com/cgi-bin/ksearch/ksearch.cgi
www.samcoprinters.com/cgi-bin/ksearch/ksearch.cgi
www.atlantech.net/cgi-bin/ksearch/ksearch.cgi
gnxas.unicam.it/cgi-bin/ksearch/ksearch.cgi
www.chinoaz.net/clerk/towncode/ksearch.cgi
www.artiqueinc.com/ksearch/ksearch.cgi
www.darch.co.uk/cgi-bin/ksearch/ksearch.cgi
www.lgusd.k12.ca.us/cgi-scripts/search/ksearch.cgi
ttmodels.co.uk/search/ksearch.cgi
www.wythallwriters.com/cgi-bin/ksearch.cgi
www.chromebits.co.uk/search/ksearch.cgi
www.eemua.co.uk/search/ksearch.cgi
www.diversifiedchemical.com/cgi-bin/ksearch/ksearch.cgi
simviation.com/cgi-bin/ksearch/ksearch.cgi
www.valleydesignequipment.com/cgi-bin/search/ksearch.cgi
nationalcarousel.org/search/ksearch.cgi
www.laserslag.com/cgi-bin/search/ksearch.cgi
|

# Matches #
matches [

# GHDB # powered by and filename
{ :ghdb=>'"Powered by KSearch" inurl:ksearch.cgi filetype:cgi' },

# Version Detection # Powered by link
{ :version=>/Powered by[\s]+<a[^>]+href="http:\/\/www\.kscripts\.com\/(scripts\.html#ksearch)?"[^>]*>KSearch[\s]+([\d\.]+[a-z]?)[\s]*<\/a>/, :offset=>1 },

# Powered by link
{ :regexp=>/Powered by[\s]+<a[^>]+href="http:\/\/www\.kscripts\.com\/(scripts\.html#ksearch)?"[^>]*>KSearch<\/a>/ },

]

end


