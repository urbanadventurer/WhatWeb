##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated version detection and ghdb match
##
Plugin.define "PhilBoard" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-27
version "0.2"
description "PhilBoard - ASP powered forum - homepage: http://www.philboards.com/"

# 47 results for "powered by philboard" -Vulnerabilities -Vulnerability @ 2010-06-27
examples %w|
www.indiessoft.com/doeaccalumni/mb/philboard.asp
www.seawindrc.com/forums/philboard.asp
www.wing2.rtaf.mi.th/board/philboard.asp
shenandoahmiddle.dadeschools.net/krule/philboard.asp
www.portviewconstruction.co.uk/replica/philboard/philboard.asp
schooloftantra.net/messageboard/philboard.asp
www.vvsu.ru/izdo/forum/philboard.asp
www.webtrafficsolutions.info/Forum/
www.ryp.co.il/forum1/philboard.asp
www.portalfitness.com/servicios/foro/philboard.asp
www.bamboochina.com.cn/bbs/philboard.asp
www.forosdehosting.com
www.ipkps.bsu.edu.ru/forum/philboard.asp
|

matches [

# GHDB Match
{ :ghdb=>'"powered by philboard" inurl:philboard.asp', :certainty=>75 },

# Version detection # Default logo HTML
{ :version=>/<img src="images\/philboard_small.gif" alt="powered by philboard [v]*([\d\.]+)" width="76" height="21" border="0" align="middle">/ },

]

end

