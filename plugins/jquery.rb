##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2
# removed :probability
##
# Version 0.3
# rewrite
##
Plugin.define "JQuery" do
author "Andrew Horton"
version "0.3"
description "A fast, concise, JavaScript that simplifies how to traverse HTML documents, handle events, perform animations, and add AJAX. - Homepage: http://jquery.com/"

# Examples #
examples %w|
www.cercaziende.it
www.freepik.com
www.petrol.si
www.biology.gatech.edu
www.dribbbler.com
www.fct.gov.ng
www.lyonmag.com
www.treshna.com
www.introitconsulting.com
vsevnet.ru
www.blanquerna.url.edu
www.gruenderszene.de
www.mof.gov.cy
www.meessendeclercq.be
www.anc.org.za
admin.credoreference.com
www.onlinesbi.com
m.pensketruckleasing.com
m.gopenske.com
xerohacking.com
www.awsum.co
www.iamplanet.com
gigas.com
chirkunov.me
www.prisa.com
enbridge.com
www.beta.undp.org
citypeoplegroup.com
www.nsi-online.it
www.computerworld.com
runners.es
www.infojobs.net
printempspoetique.free.fr
gothic-multiplayer.com
iamplanet.com
www.unicef.org
www.tdx.com.cn
habrahabr.ru
www.snapp.fr
200.150.7.81
staatsbibliothek-berlin.de
ace-spades.com
www.ipa.or.id
forumblog.org
rexgame.pl
nyack-ny.gov
mmac.mo.gov
www.floridapace.gov
magnolia.delaware.gov
www.bethel-oh.gov
hamiltonwetlands.scc.ca.gov
craigcountyva.gov
farmington-mo.gov
lccd.scc.wa.gov
https://aero-academy.grc.nasa.gov
|

# Matches #
matches [

# JavaScript
{ :regexp=>/<script [^>]*jquery/ },

# JavaScript # Version Detection
{ :version=>/jquery(\.min)?\.js\?ver=([0-9\.]+)['"]/, :offset=>1 },

]

end

