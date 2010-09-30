##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ORCA-Platform" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-04
version "0.1"
description "Welcome to ORCA Websites... We specialise in designing Professional & Affordable Websites for small to medium sized businesses across the UK. - homepage: http://www.orcawebsites.com/"

# 311 results for "powered by Orca Websites" @ 2010-08-04
examples %w|
www.advancehearing.com
www.alexandraworsley.com
www.an-x.co.uk
www.jlec.co.uk
paulsqualitybutchers.com
www.a2dcarvaletingyork.co.uk
www.heritageparkbridlington.com/history/
www.vivacubaleeds.co.uk/press_reviews/
www.cressex.bucks.sch.uk/trust_status/
www.finewinewarehouse.co.uk
www.orcawebsitesnewark.co.uk
www.orcafranchise.com
www.orca-websites-chichester.co.uk
www.orcawebsitessunderland.com
www.orcawebsitesbicester.co.uk
www.orcawebsitespreston.com
www.orcawebsitesnewcastle.co.uk
www.orcawebsitescranbrook.co.uk
www.orcawebsitescumbernauld.com
www.orcawebsiteskilmarnock.co.uk
www.hattrixsoccer.co.uk
www.clarkbathrooms-kitchens.com
www.orcawebsitesipswich.co.uk
www.orcawebsitessouthport.co.uk
www.orcawebsiteseastsuffolk.co.uk
www.orcawebsitesguildford.co.uk
www.orcawebsitesskipton.com
www.orcalocalfranchise.co.uk
www.amoreweddingsandevents.com
www.thecrownatrolleston.co.uk
www.vivacubaleeds.co.uk
www.vankloof.com
www.passornthai.com
www.teccare.com
www.s4e.co.uk
www.homestart-fh.com
www.wildsofoldham.co.uk
www.thursdaysnightclub.co.uk
www.kathrynstott.co.uk
www.lockwright.co.uk
www.orcawebsiteshammersmith.co.uk
www.suffolkcoastbusiness.co.uk
orcalocal.co.uk
www.catershop.co.uk
www.orcalocalskipton.co.uk
www.manorautosalvage.com
www.safeguardsecuritysystems.co.uk
www.cheekycondoms.co.uk
www.bluebellsfloristuk.com
www.catalystengineering.co.uk
www.benjamin-opticians.co.uk
www.justina-fashions.co.uk
www.thecricketersduncton.co.uk
www.buddysplay.co.uk
www.wadleys.co.uk
www.lktelectricalservices.com
www.soprintingsupplies.co.uk
rmcrae.orcawebsites.com
www.cglcars.co.uk
www.osbltd.co.uk
www.pspauctions.co.uk
www.gosltd.co.uk
www.breakthemouldfurniture.co.uk
www.la-farola.co.uk
www.worldofbedsburley.co.uk
www.orcawebsiteseastgrinstead.co.uk
www.liverpoolymca.org.uk
www.whrmccartney.com
www.bellini-footwear.co.uk
www.picturethisfilms.co.uk
www.merinostyle.co.uk
www.lurebar.co.uk
www.roadtrafficaccidentsolicitors4u.co.uk
www.premierhomecarescotland.co.uk
www.craigsautosalvage.co.uk
www.themediationroom1.com
www.personalinjurysolicitors4u.co.uk
www.xcedadesigns.co.uk
www.secrets-lingerie.co.uk
www.amascoassociates.co.uk
www.acs2000.co.uk
www.leehoodplumbing.co.uk
|

matches [

{ :text=>'    <meta name="author" content="ORCA Websites"/>' },
{ :text=>'    <meta name="generator" content="ORCA Platform - http://www.orcawebsites.com"/>' },
{ :text=>'<a href="http://www.orcawebsites.com/" title="Powered By ORCA Websites">Powered By ORCA Websites</a>' },
{ :text=>'                <p class="orca">Powered By <a href="http://www.orcawebsites.com/" title="ORCA Websites">ORCA Websites</a></p>' },
{ :text=>'    <!-- Macro Initialisation - Don\'t Touch! -->' },

]

end

