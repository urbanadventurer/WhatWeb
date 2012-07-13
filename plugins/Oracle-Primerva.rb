##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-Primerva" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-13
version "0.1"
description "Enterprise Project Portfolio Management (EPPM) solutions - Homepage: http://www.oracle.com/oms/eppm/index.html"

# ShodanHQ results as at 2012-07-13 #
# 2 for exponline/logon.jsp

# Google results as at 2012-07-13 #
# 21 for intitle:"Primavera Contract Management" "Oracle is a registered trademark of Oracle Corporation and/or its affiliates." "Loading Java Plugin and Security Certificate"
# 10 for inurl:"exponline/logon.jsp" intitle:"Primavera Contract Management"

# Dorks #
dorks [
'intitle:"Primavera Contract Management" "Oracle is a registered trademark of Oracle Corporation and/or its affiliates." "Loading Java Plugin and Security Certificate"',
'inurl:"exponline/logon.jsp" intitle:"Primavera Contract Management"'
]

# Examples #
examples %w|
expedition.superna.com/exponline/redirecttologonfailure.jsp
expedition.madycorp.com:81
eascontractmanager.net
cmg.atlantawatershed.org:81/exponline/redirecttologonfailure.jsp?error=timeout
exp.towncenterconstruction.com:82/exponline/logon.jsp
smtp.ryq.cl
https://emwdcm.mlmprojectservices.com/exponline/adminlogon.jsp
mail.buildwithresolute.com:82
tinyjo.com
www.leeprojects.com:81/exponline/logon.jsp
www.hellcat-ro.com/exponline/logon.jsp
pcm.jahraroad.com/exponline/logon.jsp
pcm.samuelsgroup.net/exponline/logon.jsp
www.forneyent.com
www.pm3china.com:9001/exponline/logon.jsp
contractmanager.qpm.com.qa:7001/exponline/logon.jsp
12.20.237.164:7003/exponline/logon.jsp
cm.beaverexcavating.com
https://mail.doppelmayr.com:9002/exponline/
https://hrtcm.aloharail.com/exponline/adminlogon.jsp
https://expweb.yorkeandcurtis.com/exponline/logon.jsp
https://cm.cps.k12.il.us/
https://ecipm.scgov.net/
https://saturn.apm-inc.com/
|

# Matches #
matches [

# Redirect Page # index.html # HTML Comment # Year Detection
{ :string=>/<!-- @#\$ Copyright Start\s+. 1999 - (20[\d]{2}) Primavera Systems, Inc\.  All rights reserved\./ },

# HTML Comment
{ :text=>'<!-- use the default style sheet only.... we do not know the users locale at this time -->' },

# div class="IntroAreaBuildId" # Version Detection # 14.x
{ :version=>/<div class="IntroAreaBuildId" id="BuildId">Version ([^,^\s]+, Build \d+)(&nbsp;)*<\/div>/ },

# div id="BuildId" # Version Detection # <= 13.x
{ :version=>/<div align="right" id="BuildId">Version ([^,^\s]+, Build \d+)(&nbsp;)*<\/div>/ },

# img/process_meter.gif
{ :text=>'<img src="img/process_meter.gif" border=0 id="progressimage"><br><br>Loading Java Plugin and Security Certificate' },

]

end

