##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PageUp-People" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-03
version "0.1"
description "homepage: http://www.pageuppeople.com/"
examples %w|
aglcareers.com.au
anglocoal.clients.pageup.com.au
ausenco.clients.pageup.com.au
bpretail.clients.pageup.com.au
bupa.clients.pageup.com.au
careers.aami.com.au
careers.abc.net.au
careers.aconex.com
careers.airservicesaustralia.com
careers.alcan.com.au
careers.alphapharm.com.au
careers.alphawest.com.au
careers.anglocoal.com.au
careers.apia.com.au
careers.asc.com.au
careers-au.bnpparibas.com
careers.auroraenergy.com.au
careers.awb.com.au
careers.bakersdelight.com.au
careers.baysidehealth.org.au
careers.beaurepaires.com.au
careers.brisconnections.com.au
careers.cochlear.com
careers.computershare.com
careers.conwag.com
careersearch.colesgroup.com.au
careersearch.telstra.com
careers.etsautilities.com.au
careers.fairfax.com.au
careers.fujitsu.com.au
careers.fusionhr.com.au
careers.generalpants.com.au
careers.generalpantsgroup.com
careers.horizonalliance.com.au
careers.idss.com.au
careers.iinet.net.au
careers.insuremyride.com.au
careers.invetech.com.au
careers.johnholland.com.au
careers.justcarinsurance.com.au
careers.justgroup.com.au
careers.kaz-group.com
careers.kmart.com.au
careers.lglgold.com
careers.mckesson.com.au
careers.minara.com.au
careers.mmgroupltd.com
careers.myer.com.au
careers.nab.com.au
careers.newcrest.com.au
careers.peoplecorp.com.au
careers.qr.com.au
careers.queenslandrail.com.au
careers.salesforce.com.au
careers.salmat.com.au
careers.sawater.com.au
careers.schweppesaustralia.com.au
careers.sds.com.au
careerssearch.onesteel.com
careers.selleys.com.au
careers.shannons.com.au
careers.spotless.com
careers.supercheapautogrouplimited.com.au
careers.tarongenergy.com.au
careers.technip.com.au
careers.thiess.com.au
careers.transformlives.com.au
careers.ucms.net.au
careers.visy.com.au
careers.westnet.com.au
careers.zurich.com.au
careers.acu.edu.au
careers.ausenco.com
careers.commbank.com.au
careers.yates.com.au
cisra.clients.pageup.com.au
corrs.clients.pageup.com.au
csr.clients.pageup.com.au
downeredimining.clients.pageup.com.au
downeredirail.clients.pageup.com.au
employment.brisbane.qld.gov.au
employment.melbourne.vic.gov.au
gleneira.clients.pageup.com.au
incitecpivot.clients.pageup.com.au
internaljobs.bhpbilliton.com
jobs.bcf.com.au
jobs.bendigobank.com.au
jobs.bhpbilliton.com
jobs.bpretail.com.au
jobsearch.brisbane.qld.gov.au
jobsearch.jobs.bhpbilliton.com
jobs.federalgroupcareers.com.au
jobs.goldcross.com.au
jobs.greaterdandenong.com
jobs.griffith.edu.au
jobs.linfox.com
jobs.orica.com
jobs.salesforceathome.com.au
jobs.supercheapauto.com.au
jobs.supercheapautogroup.com.au
jobs.sydneytalent.com.au
jobs.textpacific.com.au
jobs.unimelb.edu.au
leica.clients.pageup.com.au
macquarie.pageup.com.au
orica.clients.pageup.com.au
pageup2.clients.pageup.com.au
rba.clients.pageup.com.au
recruitment.powerlink.com.au
recruitment.suncorpgroup.com.au
roche.clients.pageup.com.au
searchjobs.fosters.com.au
secure.pageuppeople.com
tac.pageup.com.au
thiess.clients.pageup.com.au
westjobs.com.au
www.pageuppeople.com
www.pageuppeople.co.uk
www.wowjobs.co.za
yourcareer.rmit.edu.au
|

matches [

# 216 results @ 2010-07-02
{:ghdb=>'"Powered by PageUp People"', :certainty=>75 },

{:text=>'<a class="pageupLink" href="http://www.pageuppeople.com" target="self">Powered by PageUp People</a>' },

]

def passive
        m=[]
        m << {:name=>"sPULastSelectedLanguage Cookie" } if @meta["set-cookie"] =~ /sPULastSelectedLanguage=/
        m
end


end

