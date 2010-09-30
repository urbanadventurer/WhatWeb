##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PhilBoard" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-27
version "0.1"
description "forum - homepage: http://www.philboards.com/"
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

# 47 results @ 2010-06-27
{:name=>'GHDB: "powered by philboard" -Vulnerabilities -Vulnerability',
:certainty=>75,
:ghdb=>'"powered by philboard" -Vulnerabilities -Vulnerability'
},

]

# <img src="images/philboard_small.gif" alt="powered by philboard 1.02" width="76" height="21" border="0" align="middle">
# <img src="images/philboard_small.gif" alt="powered by philboard 1.12" width="76" height="21" border="0" align="middle">
# <img src="images/philboard_small.gif" alt="powered by philboard v1.14" width="76" height="21" border="0" align="middle">
# <img src="images/philboard_small.gif" alt="powered by philboard 1.12" width="76" height="21" border="0" align="middle">

def passive
        m=[]

        if @body =~ /<img src="images\/philboard_small.gif" alt="powered by philboard [v]*[\d\.]+" width="76" height="21" border="0" align="middle">/
                version=@body.scan(/<img src="images\/philboard_small.gif" alt="powered by philboard [v]*([\d\.]+)" width="76" height="21" border="0" align="middle">/)[0][0]
                m << {:certainty=>100,:name=>"powered by version text",:version=>version}
        end

        m

end


end

