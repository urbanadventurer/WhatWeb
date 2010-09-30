##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "QNAP-NAS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-01 
version "0.1"
description "QNAP provides a series of network attached storage (NAS) products - homepage:http://www.qnap.com/"
examples %w|
http://www.guillerault.eu:8080/cgi-bin/
http://119.247.13.81:8080/cgi-bin/
http://www.jgirado.com/cgi-bin/
http://www.belleandku.info:8080/cgi-bin/
http://dasistsehr.net:8080/cgi-bin/
http://harrelsonsplace.com:8080/cgi-bin
http://www.thatsyummymummy.com:8080/cgi-bin/
https://rovingjungs.net/cgi-bin/
http://www.didadi.info:8080/cgi-bin/
https://www.mindache.com/cgi-bin
http://pixelhunger.com:8080/cgi-bin/
http://eendje.org:8080/cgi-bin/
http://jan.portinga.eu:8080/cgi-bin/
http://www.jgrimes.co.uk:8080/cgi-bin/
http://www.silud.com:8080/cgi-bin/
http://www.zeising.net:8080/cgi-bin/
http://www.momocable.com:8080/cgi-bin/
https://qnap.expanic.com/cgi-bin/
http://193.147.58.206:8080/cgi-bin/
http://www.hakkahome.com:10101/cgi-bin/
http://philipsenechal.com:8080/cgi-bin/
https://mdelattre.com/cgi-bin/
http://melkes.net:8080/cgi-bin/
http://123.204.252.119:8080/cgi-bin/
http://legendav.dynalias.com:8080/cgi-bin/
http://train-to-attain.com:8080/cgi-bin/
http://114.32.115.33:8080/cgi-bin/
http://219.87.144.203:8080/cgi-bin/
http://www.stehagen.se:8080/cgi-bin/
http://www.air-village.com:8080/cgi-bin/
http://www.liwei.de:8080/cgi-bin/
http://60.251.202.110:8080/cgi-bin/
http://www.marcjones.co.uk:8080/cgi-bin/
http://www.nightleo.com:8080/cgi-bin/
http://www.infotronic-service.com/cgi-bin/
http://ekodagitim.com.tr:8080/cgi-bin/
https://www.johos.se/cgi-bin/
http://www.smaal.nu:8080/cgi-bin/
http://www.dickyfamily.com:3737/cgi-bin/
http://www.imetek.com:8080/cgi-bin/
http://www.ikke.net:8080/cgi-bin/
http://www.heathens.ca:8080/cgi-bin/
https://hdproserveur.com/cgi-bin/
http://www.andrewmacbeth.com:8080/cgi-bin/
https://www.vanmaurik.org/cgi-bin/
http://92.79.132.123:8080/cgi-bin/
http://xn--c3tyik98bwox.net:8080/cgi-bin/
https://www.boskoe.com/cgi-bin/
http://163.27.57.9:8080/cgi-bin/
http://www.rhk4.com:8080/cgi-bin/
http://www.jr1186.com:8000/cgi-bin/
http://www.patvibes.com:6000/cgi-bin/
https://www.cpcupload.com/cgi-bin/
http://www.qwe4.net:8080/cgi-bin/
https://www.campatuk.com/cgi-bin/
http://89.249.13.85:8080/cgi-bin/
https://www.netzwerk-24.info/cgi-bin/
http://163.27.89.170:6000/cgi-bin/
https://www.girlguide.org.sg/cgi-bin/
http://www.qwe4.com:8080/cgi-bin/
http://www.mechnaplex.com:8080/cgi-bin/
https://www.fluehmann.net/cgi-bin/
http://ftp.peng.biz:8080/cgi-bin/
http://www.laluo.com:1975/cgi-bin/
http://87.254.33.5:8080/cgi-bin/
https://bahaykubo.info:8443/cgi-bin/
http://kwlo.webhop.net:8080/cgi-bin/
http://yaohaiping.net:8080/cgi-bin/
|

matches [

# 3,990 results @ 2010-06-01
{:name=>"GHDB: inurl:Qmultimedia +thumb_index",
:certainty=>75,
:ghdb=>"inurl:Qmultimedia +thumb_index"
}, 

{:name=>"Photo Station module title", 
:text=>"<title>QNAP Photo Station</title>" },

{:name=>"Download Station module title", 
:text=>"<title>QNAP Download Station</title>" },

{:name=>"Qmultimedia module title",
:text=>"<TITLE>QNAP Multimedia Station (Photo Album)</TITLE>" },

{:name=>"Qmultimedia module title",
:certainty=>75,
:text=>"<TITLE>Multimedia Station</TITLE>" },

{:name=>"Qmultimedia module", 
:certainty=>75,
:text=>'/Qmultimedia/cgi-bin/thumb_index.cgi?folder=/Qmultimedia'
},

{:name=>"file manager module", 
:text=>"/cgi-bin/filemanager/filemanager.cgi?folder=/home/httpd/cgi-bin/filemanager/share" 
},

# fairly specific directory structure - no false positives on google
{:name=>"loading image",
:text=>"/ajax_obj/images/qnap_loading.gif"
},

# QNAP NAS - not TS Series
{:name=>"QNAP NAS (not TS Series) text",
:text=>'<table width="100%" border="0" background="/v3_menu/images/admin_header.jpg" cellpadding="0" cellspacing="0" class="12-blue">'
}

]

# An aggressive plugin can use /cgi-bin/authLogin.cgi (in XML format) to find:
# - model, firmware and software versions
# - enabled services and ports 
# Tested on TS Series:
# TS-109 PRO, TS-109 PRO II, TS-119, TS-209 PRO, TS-209 PRO II,
# TS-219, TS-239, TS-259, TS-409, TS-410U, TS-419P, TS-509, TS-559, TS-639

end

