
##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ArGoSoft-Mail-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13 
version "0.1"
description 'web based mail server - homepage: http://www.argosoft.com'
examples %w|
www.mecmont.info/addnewuser
www.network-options.net/addnewuser
www.nextwaver.com:8383/addnewuser
vbsca.ca:81/addnewuser
www.chielie.com:8081/addnewuser
inyt.pte.hu:81/addnewuser
mail.bluecreek.k12.mt.us:82/addnewuser
softkiller.ws:85/addnewuser
163.247.50.25/addnewuser
talshiar.adsl.dk:81/addnewuser
www.buchhorn.net:1080/addnewuser
www.mascot.gr:8080/addnewuser
mail.jzstock.com.cn:82/addnewuser
mail.fws.net/addnewuser
|

matches [

# 26 results @ 2010-06-13
{:name=>'GHDB: +intitle:"adding new user" "ArGoSoft Mail Server" +inurl:addnewuser -inurl',
:certainty=>75,
:ghdb=>'+intitle:"adding new user" "ArGoSoft Mail Server" +inurl:addnewuser -inurl'
}

]

# <p>ArGoSoft Mail Server Pro for WinNT/2000/XP, Version 1.8 (1.8.9.6)</p>
# <p>ArGoSoft Mail Server Pro for WinNT/2000/XP, Version 1.8 (1.8.8.7)</p>
# <p>ArGoSoft Mail Server Pro for WinNT/2000, Version 1.70 (1.7.0.3)</p>
def passive
        m=[]

        if @body =~ /<p[\ class=divhidden]*>ArGoSoft Mail Server Pro for WinNT\/2000[\/XP]*, Version [\d\.]+ \([\d\.]+\)<\/p>/
		v=@body.scan(/<p[\ class=divhidden]*>ArGoSoft Mail Server Pro for WinNT\/2000[\/XP]*, Version [\d\.]+ \(([\d\.]+)\)<\/p>/)[0].to_s
		m << {:name=>"default version text", :version=>v }
        end

	m

end

end

