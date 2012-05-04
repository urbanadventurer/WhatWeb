##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ilient-SysAid" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-24
version "0.1"
description "Ilient SysAid IT Help Desk Software - Homepage: http://www.ilient.com/"

# ShodanHQ results as at 2012-03-24 #
# 6 for location sysaid

# Google results as at 2012-03-24 #
# 120 for intitle:"SysAid Help Desk Software" "User Name" "Password"
#  15 for inurl:":8080/sysaid/"

# Dorks #
dorks [
'intitle:"SysAid Help Desk Software" "User Name" "Password"'
]

# Examples #
examples %w|
siren.calhouncotx.org:8080
helpdesk.sintec.com.mx
www.systemsmadesimple.com/support/
www.communityhealthcorps.org/helpdesk/
142.25.186.160:8080
help.wvca.us
servicedesk.health.wyo.gov
suporteguia.sysaidcss.com/EndUserPortal.jsp
sunplushelp.adventist.org
workorder.concord.edu
201.192.154.235:8080/sysaid/
hd.technion.ac.il:8080/sysaid/
factorintegracion.com.mx/sysaid/
www.argilityassist.com
support.attaintechnology.com:8080
www.ptssupport.net:9500
support.ustcs.net
support.malonead.com/Login.jsp
golions.sysaidit.com/Login.jsp
https://syssup.synel.co.il:8888/
|

# Matches #
matches [

# /sysaid/Login.jsp # by SysAid
{ :text=>'</a><u class="LookLikeLink"><span class="LookLikeLink"> by SysAid</span></u>' },

# /sysaid/Login.jsp # Forgot password link
{ :account=>/<a href="ForgotPassword\.jsp\?accountid=([^\s^"]+)" style="color: #363a3d;">/ },

# /sysaid/ # Redirect Page
{ :text=>'<p><a href="http://www.ilient.com">Help Desk Software by Ilient</a></p>' },
{ :text=>'<p><a href="http://www.ilient.com">Help Desk Software by SysAid</a></p>' },

]

end

