##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Winmail-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-27
version "0.1"
description "Winmail Server is an enterprise class mail server software system offering a robust feature set, including extensive security measures. Winmail Server supports SMTP, POP3, IMAP, Webmail, LDAP, multiple domains, SMTP authentication, spam protection, anti-virus protection, SSL/TLS security, RBL ,SPF, SpamAssassin, Network Storage, remote access, Web-based administration, and a wide array of standard email options such as filtering, signatures, real-time monitoring, archiving, and public email folders. - Homepage: http://www.magicwinmail.net/"

# Google results as at 2011-06-27 #
# 343 for intitle:"Powered by Winmail Server - Login" +Username +Password

# Dorks #
dorks [
'intitle:"Powered by Winmail Server - Login" +Username +Password'
]

# Examples #
examples %w|
mail.investguangzhou.gov.cn:6080
mail.spqi.gov.cn:6080
mail.dehua.gov.cn
mail.cpol.gov.cn
www.dygs.gov.cn:6080
jcy.yz.gov.cn:6080
hnjtde.gov.cn:6080
mail.sczw.gov.cn:6080
www.shuangyang.gov.cn:6080
www.ahipo.gov.cn:3000
www.hbjc.gov.cn:6080
www.cd12366.gov.cn:6080
www.csjy.gov.cn:6080
www.fjwater.gov.cn:6080
mail.zjhw.gov.cn
www.hhhtdx.gov.cn:6080
sgepb.gov.cn/mail/
www.jhk.gov.cn:6080
mail.bjchp.gov.cn
mail.sdaj.gov.cn:6080
mail.sijing.gov.cn
mail.ptec.gov.cn:6080
mail.xygtzyj.gov.cn:6080
www.gdmzsafety.gov.cn:6080
www.fzkj.gov.cn:8383
big5.fmprc.gov.cn/gate/big5/mail.amb-chine.fr/admin/index.php
mail.lnnet.gov.cn
mail.guilin.gov.cn
mail.qjzx.gov.cn
www.gxinfo.gov.cn:3000
www.gz12358.gov.cn:2004/www/index.php
mail.zjport.gov.cn
mail.lyls.gov.cn
www.szsmb.gov.cn:6080
www.sahvet.gov.cn/mail/
mail.lfdz.gov.cn:6080
mail.lngeo.gov.cn
mail.tjsw.gov.cn
mail.gdfire.gov.cn
www.hbsea.gov.cn:6080
cdmail.cdeic.gov.cn
mail.nbbc.gov.cn:6080
mail.lzsafety.gov.cn:6080
|

# Matches #
matches [

# Title
{ :text=>'<title>WebMail | Powered by Winmail Server - Login</title>' },
{ :text=>'<title>Web Administration | Powered by Winmail Server - Login</title>' },

# Register Page
{ :text=>'<td class=default>&nbsp;<input type=password name=f_password size=30 maxlength=64 onkeyup="javascript: EvalPwd(this.value);" onchange="javascript: EvalPwd(this.value);" class="textbox"><font color=#ff0000>*</font></td>' },

# Login Page # Powered by text
{ :text=>'<a target="_blank" href="http://www.magicwinmail.net?sid=winmailcust">Powered by Winmail Server</a>&nbsp;' },

# Admin Page # Powered by text
{ :text=>'<td align="right" class="hometext"><a href="http://www.magicwinmail.net?sid=winmailcust" target=_blank>Powered by Winmail Server</a></td>' },

# Logo
{ :text=>'<td rowspan=2 width="264" bgcolor="#FFFFFF"><img src="themes/default/images/mail_pic.jpg" width="264" height="102"></td>' },

# Mail Server Detection
{ :string=>/<td style="color:#888888; font-size: 11px;">&nbsp;&nbsp;&nbsp;&nbsp;POP3,SMTP Server: <font color=red>([^\s^<]+)<\/font><\/td><\/tr>/ },

# Remember me link
{ :text=>'<input type=checkbox name=f_autologin value="1"><acronym style="cursor: hand;" OnClick="f_autologin.click()">Automatically login at next time</acronym>' },

# Version Detection # HTML Comment
{ :version=>/<!--[\s]+&copy 20[\d]{2}(-[\d]{4})? AMAX Information Technologies Inc\. All Rights Reserved\.[\s]+WebMail \| Powered by Winmail Server ([^\s]+)[\s]+-->/, :offset=>1 },

]

# Passive #
def passive
	m=[]

	# magicwinmail_default_language cookie
	m << { :name=>"magicwinmail_default_language cookie" } if @meta["set-cookie"] =~ /magicwinmail_default_language=[^;]+;/

	# magicwinmail_domain_name cookie
	m << { :name=>"magicwinmail_domain_name cookie" } if @meta["set-cookie"] =~ /magicwinmail_domain_name=[^;]+;/

	# magicwinmail_login_userid cookie
	m << { :name=>"magicwinmail_login_userid cookie" } if @meta["set-cookie"] =~ /magicwinmail_login_userid=[^;]+;/

	# Return passive matches
	m
end
end

