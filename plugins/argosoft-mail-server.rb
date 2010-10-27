##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated matches and version detection
##
Plugin.define "ArGoSoft-Mail-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13 
version "0.2"
description 'ArGoSoft-Mail-Server web interface - homepage: http://www.argosoft.com/'

# 26 results for GHDB: +intitle:"adding new user" "ArGoSoft Mail Server" +inurl:addnewuser -inurl @ 2010-06-13
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

# GHDB Match
{ :ghdb=>'+intitle:"adding new user" "ArGoSoft Mail Server" +inurl:addnewuser', :certainty=>75 },

# Version detection
{ :version=>/ArGoSoft Mail Server Pro for WinNT\/2000[\/XP]*, Version [\d\.]+ \(([\d\.]+)\)<\/p>/, :regexp_offset=>0 }

]

# Version detection # HTTP Header Server text
def passive
	m=[]

	server=@meta["server"] if @meta.keys.include?("server")
	server=@meta["Server"] if @meta.keys.include?("Server")
	if server =~ /ArGoSoft Mail Server Pro for WinNT\/2000[\/XP]*, Version [\d\.]+ \(([\d\.]+)\)/
		version=server.scan(/ArGoSoft Mail Server Pro for WinNT\/2000[\/XP]*, Version [\d\.]+ \(([\d\.]+)\)/)[0][0]
		m << {:version=>version}
	end

	m

end

end

