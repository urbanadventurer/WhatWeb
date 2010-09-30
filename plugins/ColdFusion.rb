##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ColdFusion" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-15
version "0.1"
description "Adobe ColdFusion application server and software enables developers to rapidly build, deploy, and maintain robust Internet applications for the enterprise. - homepage: http://www.adobe.com/products/coldfusion/"

# 30 results for intitle:"ColdFusion Administrator Login" @ 2010-08-15
examples %w|
asb.co.uk
online.ctcd.edu/cfadmin/datasources/
pegismap.penang.gov.my/PENANG/CFIDE/administrator/index.cfm
sfsa.tiktak.ch/index.cfm
testing.ctc-disted.net/cfadmin/
www.104boss.com.tw/alliance/CFIDE/administrator/index.cfm
www.aarc.org/CFIDE_old1/administrator/index.cfm
www.aarc.org/CFIDE/administrator/index.cfm
www.frrp.org.uk
www.gordonresponse.dpc.wa.gov.au
www.koopa-adv.de
|

matches [

# Admin page
{ :text=>'	<title>ColdFusion Administrator Login</title>' },
{ :regexp=>/	<meta name="Author" content="Copyright [\(c\(\ ]*[0-9]{4}-[0-9]{4} Macromedia[\ Corp|\,\ Inc]+. All rights reserved.">/ },
{ :text=>"	{   document.write(\"<link rel='STYLESHEET' type='text/css' href='./cfadmin_ns.css'>\");}" },
{ :text=>'<form name="loginform" action="./enter.cfm" method="POST" onSubmit="cfadminPassword.value = hex_hmac_sha1(salt.value, hex_sha1(cfadminPassword.value));" >' },
{ :text=>'				<input name="cfadminPassword" type="Password" size="15" style="width:15em;" class="label" maxlength="100" id="admin_login">' },
{ :text=>'	Macromedia, the Macromedia logo, Macromedia ColdFusion and ColdFusion are<br />' },
{ :text=>'	<tr><td><img src="./images/mx_copyrframe.gif" width="2" height="57" border="0" alt="ColdFusion MX" hspace="10"></td>' },

# Detection of version 9 using image containing "Coldfusion 9" text
{ :md5=>'596b3fc4f1a0b818979db1cf94a82220', :version=>'9', :url=>'images/loginbackground.jpg' }

]

def passive
        m=[]

	# Cookies
	m << { :name=>"CFAUTHORIZATION_cfadmin Cookie" } if @meta["set-cookie"] =~ /CFAUTHORIZATION_cfadmin=/

	# Version detection using admin panel text
        if @body =~ /Enter your RDS or Admin password below/

		if @body =~ / [0-9\.\,\-_a-z]+<\/strong><br \/>/
                	version=@body.scan(/ ([0-9\.\,\-_a-z]+)<\/strong><br \/>/)[0][0]
       	        	m << {:version=>version}
	        end
		if @body =~ /				Version:([0-9\.\,\-_a-z]+)<\/strong><br \/>/
			version=@body.scan(/				Version:([0-9\.\,\-_a-z]+)<\/strong><br \/>/)[0][0]
			m << {:version=>version}
		end

	end

        m

end


end

