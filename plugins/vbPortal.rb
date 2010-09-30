##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "vbPortal" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-27
version "0.1"
description "Portal and CMS for vBulletin - hoempage: http://www.vbportal.com/"

# 154 results for "Portal By vbPortal Version " @ 2010-08-27
examples %w|
horrordvds.com
bytephoto.com
beta.renderotica.com/fora/
icmag.com
planetdragonball.net
grunwalds.com
unrealtournament.villageidiot.net
sharedportal.info
horrordigital.com
v2-forum.com/viewarticle.php
welderzone.com
www.cnczone.com
www.limpkinw.com
www.caddis.co.uk
www.satsupport.net/portal/
www.peugeot-gti.net/forums/
www.smgvbest.com/photopost/
www.hipforums.com/modules/News/
www.steppinoutnewmexico.com/
www.vizdepot.com/forums/
www.global-voices.info
www.scrapbookjunction.com/forums/
www.rapworlds.com
www.starwarsepics.com
www.amgforums.com
www.turborides.com
www.dslrexchange.com
www.abfnet.com
www.bitbendertest.com
www.bitbenderforums.com
www.kitten.com.my
www.firewallforums.com
www.iaap.co.uk/forum/
www.venturerider.org
www.worldspankingforum.com
www.world-spanking-forum.net/forums/
www.world-spanking-forum.com/forums/
www.delikan.net
www.db-forum.de
www.bghelp.net
|

matches [

{ :text=>'<meta name="generator" content="vbPortal - Copyright 2010" />' },
{ :text=>'	<!-- Do not remove  or your scheduled tasks will cease to function -->' },

]

# Version detection
def passive
        m=[]

	# Meta generator
        if @body =~ /<meta name="generator" content="vbPortal [\d\.]+" \/>/
                version=@body.scan(/<meta name="generator" content="vbPortal ([\d\.]+)" \/>/)[0][0]
                m << {:version=>version}
        end

	# Portal by text
	if @body =~ /Portal By vbPortal Version [\d\.]+<br \/>/
		version=@body.scan(/Portal By vbPortal Version ([\d\.]+)<br \/>/)[0][0]
		m << {:version=>version}
	end

        m

end


end

