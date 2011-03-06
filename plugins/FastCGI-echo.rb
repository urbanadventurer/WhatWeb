##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FastCGI-echo" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-10
version "0.1"
description "Many Oracle web server installations have a fcgi-bin/echo script left over from default demo (google for inurl:fcgi-bin/echo). This file should have been removed as per: http://download.oracle.com/docs/cd/B14099_19/core.1012/b13999/checklist.htm#BABIBCIC"
# Vulnerable to XSS: /fcgi-bin/echo?<script>alert(1)</script>

# 247 results for inurl:fcgi-bin/echo intitle:"FastCGI echo" @ 2010-10-10
# 53 results for inurl:fcgi-bin/echo intitle:"FastCGI echo" inurl:.gov @ 2010-10-10
# 46 results for inurl:fcgi-bin/echo intitle:"FastCGI echo" inurl:.edu @ 2010-10-10
examples %w|
www2.city.yokohama.jp/fcgi-bin/echo
tfcorclmail.teijin.co.id:7778/fcgi-bin/echo
www.mrwlogistica.com/fcgi-bin/echo
fipav2.federvolley.it/fcgi-bin/echo
www.batiproduits.com/fcgi-bin/echo
www.unirem.edu.mx:7779/fcgi-bin/echo
www.batonyterenye.hu:7778/fcgi-bin/echo
196.40.57.157/fcgi-bin/echo
61.172.251.26/fcgi-bin/echo
onlinesuperlist.com/fcgi-bin/echo
shop.rtpumps.com/fcgi-bin/echo
siif.catie.ac.cr/fcgi-bin/echo
www.klocworld.net/fcgi-bin/echo
services.emes.com.tr:7777/fcgi-bin/echo
www.santeecooperhydro.com/fcgi-bin/echo
my.home1.ul.com/fcgi-bin/echo
https://admin.une.edu.au/fcgi-bin/echo
craftsmanpress.com.au/fcgi-bin/echo
bos1portal1.aspect.com/fcgi-bin/echo
attila.inbio.ac.cr:7777/fcgi-bin/echo
iworldontap.net/fcgi-bin/echo/
purefishingpop.com/fcgi-bin/echo/
www.myrisoprinter.org/fcgi-bin/echo
www.grandbaiegolfclub.com/fcgi-bin/echo
211.10.211.10/fcgi-bin/echo
www.pgjver.gob.mx/fcgi-bin/echo
https://iweb.toshibatec.com/fcgi-bin/echo
tnpl.in:7777/fcgi-bin/echo
https://82.215.65.200:7777/fcgi-bin/echo
oracleapache.panatlantic.com:6636/fcgi-bin/echo
sc.inegi.gob.mx/fcgi-bin/echo
apps.mef.gob.pe/fcgi-bin/echo
arraprweb1.itd.state.ma.us/fcgi-bin/echo
library.nyp.edu.sg/fcgi-bin/echo/
isgsoas.isgs.uiuc.edu:7781/fcgi-bin/echo
ucsgweb1.ucsg.edu.ec:7779/fcgi-bin/echo
dbforms.ga.gov.au/fcgi-bin/echo
www.mmd.gov.in:7777/fcgi-bin/echo
www3.mp.rj.gov.br/fcgi-bin/echo/
www.seniat.gov.ve/fcgi-bin/echo
oraweb.hhs.mt.gov/fcgi-bin/echo
portal.environment.wa.gov.au/fcgi-bin/echo
portal.water.wa.gov.au/fcgi-bin/echo
evisa.mfa.gov.ir:7780/fcgi-bin/echo
www3.mp.rj.gov.br/fcgi-bin/echo
oasa.sef.rj.gov.br/fcgi-bin/echo
noreimako.ideam.gov.co:7782/fcgi-bin/echo
webspl1.al.sp.gov.br/fcgi-bin/echo
www7.fazenda.sp.gov.br/fcgi-bin/echo
www.pereira.gov.co/fcgi-bin/echo
www.trt20.gov.br:7780/fcgi-bin/echo
www.vista.gov.vn/fcgi-bin/echo
sinu.dapd.gov.co/fcgi-bin/echo
www.osonline.gov.uk/fcgi-bin/echo
mytest.sfwmd.gov/fcgi-bin/echo
my.sfwmd.gov/fcgi-bin/echo
portal.hud.gov/fcgi-bin/echo
www.balama.mafraq.gov.jo/fcgi-bin/echo
mail2.nic.gov.jo/fcgi-bin/echo
edtm.dtm.gov.tr/fcgi-bin/echo
alcasdqs.bogota.gov.co:7778/fcgi-bin/echo
mapas.bogota.gov.co/fcgi-bin/echo
alcasdqs.bogota.gov.co/fcgi-bin/echo
oaspruebas.policia.gov.co:7778/fcgi-bin/echo
oasweb.policia.gov.co/fcgi-bin/echo
portal.paaf.gov.kw/fcgi-bin/echo
ias.paaf.gov.kw/fcgi-bin/echo
www.ciudaddemendoza.gov.ar:9778/fcgi-bin/echo
report.tuik.gov.tr/fcgi-bin/echo
www.jhr.gov.jo/fcgi-bin/echo
servoaspr.imprenta.gov.co:7778/fcgi-bin/echo
servoaspr.imprenta.gov.co/fcgi-bin/echo
rtis.td.gov.hk/fcgi-bin/echo
interactive.web.insurance.ca.gov/fcgi-bin/echo
events.nitc.gov.jo/fcgi-bin/echo
systema39.dane.gov.co:7778/fcgi-bin/echo
suamox03.dane.gov.co:7778/fcgi-bin/echo
blessapptest.bless.gov.my/fcgi-bin/echo
asycuda.customs.gov.bb/fcgi-bin/echo
sisec.seplan.to.gov.br/fcgi-bin/echo
seap.sad.mt.gov.br/fcgi-bin/echo
eapp40.esigef.mef.gov.ec:7778/fcgi-bin/echo
web.superban.gov.ec/fcgi-bin/echo
dw.saude.gov.br/fcgi-bin/echo
consulta.trtrio.gov.br/fcgi-bin/echo
|

matches [

{ :text=>'SCRIPT_NAME=/fcgi-bin/echo' },
{ :text=>'<title>FastCGI echo</title><h1>FastCGI echo</h1>' },
{ :text=>'REQUEST_URI=/fcgi-bin/echo' },

# Version detection
{ :version=>/HTTP_ORACLE_CACHE_VERSION=([\d\.]+)/ },
{ :version=>/SERVER_SOFTWARE=([^\n]+)/ },
{ :version=>/SERVER_SIGNATURE=<ADDRESS>([^<]+)/ },

]

end

