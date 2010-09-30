##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SyndeoCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
version "0.1"
description "A Content Management System (CMS) for primary schools, which helps you manage and maintain your website. It can also be a very usefull CMS for small companies or non profit organizations.  - homepage: http://www.syndeocms.org"

# 117 results for "powered by SyndeoCMS" @ 2010-08-06
examples %w|
www.syndeocms.org/demo/
www.delahey.org.au
www.sawyersvalleyps.det.wa.edu.au
borondameadowselementary.com
project.futureofeurope.net
iitms.org
www.huskiesutefootball.com
jordanhightrack.com
web51.sit-mainz.info
demo-server.net23.net
ou-fotinov.org
jordanhighfootball.org
www.bloemenbuurt-helmond.nl
ccgi.windmilleg.plus.com
www.d1031599.dotsterhost.com
www.digirapport.eu
www.2master.com
www.amshaven.edu.almere.nl
www.bs-dewijngaard.be
www.kbsvliedberg.nl
www.doefmat.nl
www.vnfh.nl
www.kadoes.nl
www.obsdedriebond.nl
www.de-horizon.net
www.sbolaucup.nl
www.cspi.qc.ca
www.ttodrenthe.nl
www.fdfoverlade.dk
www.campe-gymnasium-holzminden.de
km-rogozen.com
www.deraveinterim.nl
www.glashelderglas.nl
www.decata.info/2b/
www.kita-muehlweg.de
www.bredeschool-hillesluis.nl
www.verderwonen.nl
www.evang-hartberg.at
associacaomundodalua.com
www.heilighartschool.nl
www.grietjewillemsma.nl
www.familiegroenen.nl
www.grietjewillemsma.nl
www.heilighartschool.nl
www.bredeschool-hillesluis.nl
www.familiegroenen.nl
www.bongerd.edu.almere.nl
|

matches [

{ :regexp=>/Powered by <a href="http:\/\/www.syndeocms.org[\/]*" target="_blank">/ },
{ :text=>'Powered by <a href="http://www.syndeoCMS.org/" target="_blank">SyndeoCMS</a>' },
{ :text=>'<!-- Please don\'t remove my credits! I worked hard to create this theme and distribute it freely. Thanks! -->' },
{ :regexp=>/Powered by <a href="http:\/\/www.syndeo[CMS|cms]*.org[\/]*"[\ title="SyndeoCMS"]*>SyndeoCMS<\/a>/ },
{ :text=>'			<div class="right">Powered by <a href="http://www.syndeocms.org/">SyndeoCMS</a></div>' },
{ :regexp=>/Site created with <a href="http:\/\/www.syndeocms.org[\/]*">SyndeoCMS<\/a>/ },
{ :text=>'Powered by <a href="http://syndeo_logo.png/" target="_blank">SyndeoCMS</a>' },

]

def passive
        m=[]

        if @body =~ /<div class="meta"><center>Powered by <a href="http:\/\/www.syndeoCMS.org\/" target="_blank">SyndeoCMS ([\d\.]+)<\/a>/
                version=@body.scan(/<div class="meta"><center>Powered by <a href="http:\/\/www.syndeoCMS.org\/" target="_blank">SyndeoCMS ([\d\.]+)<\/a>/)[0][0]
                m << {:version=>version}
        end

        m

end

end

