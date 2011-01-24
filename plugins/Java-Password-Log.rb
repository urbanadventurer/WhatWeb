##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Java-Password-Log" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.1"
description "This plugin detects Java password.log files and retrieves the usernname, password and URL."

# 68 results for password END_FILE ext:log @ 2010-10-15
examples %w|
140.116.71.92/cmdme/2/Java_applet2/password.log
ayura.udea.edu.co/cursos/aprobar/password.log
egma1.e-technik.tu-ilmenau.de/~bartl/urlaub/passwort/passwort.log
mitglied.multimania.de/Rick_Cooper/mbr/password.log
mitglied.multimania.de/vns/password.log
sites.google.com/site/benmcclintock/password.log
talko.helia.fi/sivut/password.log
utopia.duth.gr/~sdelis/stoixeia/password.log
homepage.ntlworld.com/stags/password.log
www.freewebs.com/line-web/bruger/password.log
www.oocities.com/tansaauckland/password.log
www.ting.com.tw/zh-tour/club/password.log
www.ugn-umweltconsult.de/deutsch/projektsite/projekt1/password.log
|

# Extract username, password and URL
def passive
	m=[]

	if @body =~ /END_FILE/

		if @body =~ /^name: = "([^\"]+)";[\r]?\npassword: = "([^\"]+)";[\r]?\nURL: = "([^\"]+)";/
			modules=@body.scan(/^name: = "([^\"]+)";[\r]?\npassword: = "([^\"]+)";[\r]?\nURL: = "([^\"]+)";/)
			m << {:module=>modules}
		end

	end

	m

end

end

