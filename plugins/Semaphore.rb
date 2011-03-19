##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Semaphore" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-19
version "0.1"
description "Bridging the gap between layman's terms and official language to provide users with more accurate search results. - Homepage: http://www.smartlogic.com/poweredbysemaphore"

# Google results as at 2011-03-19 #
# 40 for "Powered by Semaphore" inurl:semaphoreserver.exe filetype:exe

# Examples #
examples %w|
search.sholland.gov.uk/cgi-bin/semaphoreserver.exe?CMD=search.run&SAVEDB=shdc&SAVEQUERY00=valuation&SAVESTYPE=simple&B2=I1counciltaxbanding&PROP00=t%3Di&QUERY01=counciltaxbanding&B2_DESC=Council%20tax%20banding&PROP01=P%3DI1%2CS%3Dnone%2CZ%3Don&THES_REC=2714&TBDB=shdc_taxonomy&HIDECONCEPT=1
sutton.aprsmartlogik.com/cgi-bin/sutton/semaphoreserver.exe?PROP00=t%3Dp&QUERY00=gov&SAVEDB=lbsutton&SAVEQUERY00=
aprvli.vlihosting.co.uk/cgi-bin/semaphoreserver.exe?CMD=search.run&TOPDOC=10&HIDECONCEPT=1&SAVEB=&SAVEDB=wycombeDC&SAVEQUERY00=gov&SAVESTYPE=simple&SAVESOURCESTEM=gov:gov%7C
search.islington.gov.uk/scripts/semaphoreserver.exe?PROP00=t%3Dp&SAVEDB=islington&SAVEORGANISE_CODED=%3AF9&SAVEB2=I1socialinclusion&SAVEB2_DESC=Social+inclusion&SAVEQUERY00=bullying&SAVEPROP00=t%3Dp&SAVEQUERY01=socialinclusion&SAVEPROP01=P%3DI1%2CS
semaphore2.hants.gov.uk/scripts/semaphoreserver.exe?CMD=search.run&SAVEB2=I1industrialproperties&SAVEB2_DESC=Industrial%20properties&SAVEHIDECONCEPT=1&SAVEPROP01=P%3DI1%2CS%3Dnone%2CZ%3Don&SAVEQUERY01=industrialproperties&SAVEDB=hants&SAVEQUERY00=estates&SAVESTYPE=simple&SAVESOURCESTEM=estates:estat%7C&SAVETBDB=hants_ipsv1&SAVETHES_REC=2378&PROP00=t%3Di
search.hants.gov.uk/scripts/semaphoreserver.exe?CMD=search.run&SAVEB2=I1visualarts&SAVEB2_DESC=Visual%20arts&SAVEDB=hants&SAVEHIDECONCEPT=1&SAVEPROP01=P%3DI1%2CS%3Dnone%2CZ%3Don&SAVEQUERY00=soundness&SAVEQUERY01=visualarts&SAVESTYPE=simple&SAVETBDB=hants_ipsv1&SAVETHES_REC=245&SAVESOURCESTEM=soundness:sound%7C&PROP00=t%3Di
search.bedfordshire.gov.uk/scripts/semaphoreserver.exe?CMD=search.run&SAVEDB=bbc&SAVEB=Len&SAVEQUERY00=&SAVEQUERY07=MUSCOPYCGI:QUERY00&SAVEPROP07=t%3Di%2Cz%3Don%2Cp%3DI9%2Cs%3Dnone&SAVESTYPE=AZ&SAVEPROFILE=&SAVETAB=ALL&B2=I1liceinfestation&PROP00=t%3Di&QUERY01=liceinfestation&B2_DESC=Lice%20infestation&PROP01=P%3DI1%2CS%3Dnone%2CZ%3Don&THES_REC=2727&TBDB=bbc_taxonomy&HIDECONCEPT=1&TBSY=Lice%20infestation
www.centralbedfordshire.gov.uk/scripts/semaphoreserver.exe?FILE=search&SAVEDB=cbeds
search.e-lindsey.gov.uk/cgi-bin/semaphoreserver.exe?QUERY00=triton+knoll&search.x=8&search.y=21&search=Go&DB=e-lindsey&STYPE=simple&QUERY07=MUSCOPYCGI%3AQUERY00&PROP07=t%3Dp%2Cz%3Don%2Cp%3DI9%2Cs%3Dnone
index.weymouth.gov.uk/scripts/semaphoreserver.exe?CMD=search.run&SAVEDB=weymouth&SAVEQUERY00=conservation%20areas&SAVESTYPE=simple&SAVEORGANISE_CODED=:f9&B2=I1conservationareas&PROP00=t%3Di&QUERY01=conservationareas&B2_DESC=Conservation%20areas&PROP01=P%3DI1%2CS%3Dnone%2CZ%3Don&THES_REC=961&TBDB=weymouth_tax&HIDECONCEPT=1
www.ryedale.gov.uk/scripts/semaphoreserver.exe?STYPE=AZ&AZ=W&DB=ryedale&B=Len&QUERY01=wastedisposal&PROP01=s=none,t=b,p=I1&ORGANISE_CODED=:F9&TBPT=Waste%20disposal&TBSY=Waste%20disposal&TBDB=ryedale_taxonomy&PROP00=t%3Di&QUERY00=&B2_DESC=Waste%20disposal&B2=I1wastedisposal
www.sypte.co.uk/scripts/semaphoreserver.exe?STYPE=AZ&CMD=search.run&AZ=B&DB=ecp_barnsley&B=Len&QUERY01=buslanesandcorridors&PROP01=s=none,t=b,p=I1&ORGANISE_CODED=:F9&TBPT=Bus%20lanes%20and%20corridors&TBSY=Bus%20lanes%20and%20corridors&TBDB=ecp_barnsley_taxonomy&PROP00=t%3Di&QUERY00=&B2_DESC=Bus%20lanes%20and%20corridors&B2=I1buslanesandcorridors
www.dacorum.gov.uk/aprs/scripts/semaphoreserver.exe?DB=dacorum&FILE=search
search.sholland.gov.uk/cgi-bin/semaphoreserver.exe?B2=I1planningapplications&B2_DESC=Planning%20applications&CMD=search.run&HIDECONCEPT=1&PROP00=t%3Di&PROP01=P%3DI1%2CS%3Dnone%2CZ%3Don&QUERY01=planningapplications&SAVEDB=shdc&SAVEQUERY00=applicant&SAVESTYPE=simple&TBDB=shdc_taxonomy&THES_REC=6
search.dorsetforyou.com/cgi-bin/semaphoreserver.exe?CMD=search.run&HIDECONCEPT=1&SAVEB=F1Dorset%20For%20You&SAVEB2=I1health&SAVEB2_DESC=Health&SAVEDB=new_d4u&SAVEORGANISE_CODED=:F9&SAVEPROP00=t%3Di&SAVEPROP01=P%3DI1%2CS%3Dnone%2CZ%3Don&SAVEQUERY00=enter%20keyword&SAVEQUERY01=health&SAVESTYPE=SIMPLE&SAVETBDB=d4u_ipsv2&SAVETHES_REC=186&SAVESOURCESTEM=enter:enter%7Ckeyword:keyword%7C&TOPDOC=460
search.rochdale.gov.uk/scripts/semaphoreserver.exe?CMD=&TOPDOC=20&HIDECONCEPT=1&SAVEQUERY03=&SAVEQUERY09=(rmbc%20)&SAVEANDQUERY=rmbc&SAVEAND_DISPLAY=SLK_DYM_START_TAGmbcSLK_DYM_END_TAG&SAVEAND_NEWQUERY=mbc&SAVEDB=rochdale&SAVEPROP07=t%3Dp%2Cz%3Don%2Cp%3DI9%2Cs%3Dnone&SAVESTYPE=ADVANCED&SAVESOURCESTEM=rmbc:rmbc%7C&SAVETHRESHOLD=0
www.worthing.gov.uk/cgi-bin/semaphoreserver.exe?ORGANISE_CODED=%3Af9&QUERY00=goring&SAVEDB=worthing
aprvli.vlihosting.co.uk/cgi-bin/semaphoreserver.exe?CMD=search.run&SAVEB2=I1historicbuildings&SAVEB2_DESC=Historic%20buildings&SAVEHIDECONCEPT=1&SAVEPROP01=P%3DI1%2CS%3Dnone%2CZ%3Don&SAVEQUERY01=historicbuildings&SAVEB=&SAVEDB=wycombeDC&SAVEQUERY00=granting&SAVESTYPE=simple&SAVESOURCESTEM=granting:grant%7C&SAVETBDB=wycombe_taxonomy&SAVETHES_REC=508&PROP00=t%3Dp
sutton.aprsmartlogik.com/cgi-bin/sutton/semaphoreserver.exe?PROP00=t%3Dp&QUERY00=scl&SAVEDB=lbsutton&SAVEQUERY00=
|

# Matches #
matches [

# GHDB
{ :ghdb=>'"Powered by Semaphore" inurl:semaphoreserver.exe filetype:exe' },

# Error Page
{ :text=>"<html><head><title>Semaphore server Error</title></head><body>" },

# HTML Comment
{ :text=>'<!-- Display the "Powered by Semaphore" logo -->' },

# Powered by logo HTML
{ :regexp=>/<a href="http:\/\/www.smartlogic.com\/poweredbysemaphore"><img src="[^"^>]+\/semaphore\/semaphore_small\.gif"[^>]+alt="Powered by Semaphore" title="Powered by Semaphore" \/><\/a>/ },

]

end


