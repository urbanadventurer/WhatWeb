##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BMC-Remedy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-11
version "0.1"
description "BMC Remedy Action Request System (also known as Remedy, AR System and ARS) is a client-server software application development environment from BMC Software (originally developed by Remedy Corporation). BMC Remedy Mid-Tier is a server component in the Action Request System for web access. - Homepage: http://www.bmc.com/products/offering/itsm-premise-ondemand.html"

# More Info #
# http://en.wikipedia.org/wiki/BMC_Remedy_Action_Request_System
# http://en.wikipedia.org/wiki/AR_Mid-Tier

# Google results as at 2011-07-11 #
# 103 for intitle:"Remedy Mid Tier" "User Name" +Password

# Dorks #
dorks [
'intitle:"Remedy Mid Tier" "User Name" "Password"'
]

# Examples #
examples %w|
soporte.quitze.com.mx/arsys/shared/login.jsp
str.bsnl.co.in:8014/arsys/shared/login.jsp
hcl-remedy.hcl.in
remedy.perceptis.com
hibajegy.invitel.co.hu
servicedesk.servicegruppen.dk
support.koan-it.com
v-rem-lnx1.nwu.ac.za:8080/MidTier/
supportportal.tideworks.com
remedysupport.globecommsystems.com/arsys/
https://help.afsv.net/
https://servicios.itsm.ejie.net/arsys/shared/login.jsp
https://csdpmt1.k12.hi.us/
https://remedy.its.ws
ccconline.nwpg.gov.za/arsys/shared/login.jsp
https://its.support.nc.gov/
https://itsm.ca.gov/arsys/home
gemini.srv.cs.cmu.edu
support.utoledo.edu
itsm.uws.edu.au
support.utoledo.edu
https://helpdesk.uh.edu/arsys/
https://remedy.ccit.arizona.edu:8081/arsys/
https://helpdesk.ksu.edu/arsys/shared/login.jsp
https://hd.kc.us.army.mil/
https://remedy1.afbudsys.disa.mil/arsys/home
https://mt1.afrc.af.mil/arsys/
|

# Matches #
matches [

# Login Page # HTML Comment
{ :text=>'<!-- common to all login jsps - not localized information -->' },

# Login Page # HTML Comment
{ :text=>'<!-- Added to prevent iFrame exploit. Need to comment out for portlet to work -->' },

# Login Page # Clear form button
{ :text=>'<input type="button" name="clear" value="Clear" class="Login" onClick="clearLogin();"><!--;-->' },
{ :text=>'<input type="button" name="clear" value="Clear" onClick="clearLogin();"><!--;-->' },

# Version Detection # Title
{ :version=>/<title>(BMC&nbsp;)?Remedy&nbsp;Mid&nbsp;Tier&nbsp;([^\s]+) - (Error page|Login)<\/title><!--;-->/, :offset=>1 },
{ :version=>/<title>(BMC )?Remedy Mid Tier ([^\s]+) - (Error page|Login)<\/title>/, :offset=>1 },

]

end

