##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Accellion-Secure-File-Transfer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-20
version "0.1"
description "Accellion Secure File Transfer (SFT) - Homepage: http://www.accellion.com/"

# ShodanHQ results as at 2011-11-20 #
# 1,005 for location courier mail_user_login.html
#   991 for sfcurl=deleted

# Google results as at 2011-11-20 #
# 37 for inurl:"courier/1000@/mail_user_login.html"

# Dorks #
dorks [
'inurl:"courier/1000@/mail_user_login.html"'
]

# Examples #
examples %w|
63.149.188.82
50.16.201.101
184.94.11.5
67.221.227.60
65.205.167.64
198.37.32.41
217.34.170.13
75.144.102.23
https://sft.onyx-pharm.com
https://transfer.amvbbdo.com
https://sendfiles.riotinto.com
https://transfer.ndc.nasa.gov
https://accellion.mc.vanderbilt.edu
https://transfer.bidmc.harvard.edu
https://transfer.med.cornell.edu
https://securetransfer.emcor.net
https://me2usd2.qualcomm.com
|

# Matches #
matches [

# HTTP Set-Cookie Header # sfcurl=deleted;
{ :search=>"headers[set-cookie]", :regexp=>/sfcurl=deleted;/, :certainty=>25 },

# HTTP Location Header
{ :search=>"headers[location]", :regexp=>/\/courier\/[\d]+@\/mail_user_login\.html\?$/ },

# /courier/[\d]+@/mail_user_login.html # /favicon.ico
{ :url=>"/favicon.ico", :md5=>"9423d9e9ce004c29dd5bc622f0112123" },

# /courier/[\d]+@/mail_user_login.html # Form
{ :text=>'<form name="form1" method="post" action="mail_user_login_exec.html" onsubmit="document.form1.submit.disabled=true;">' },

# /courier/[\d]+@/mail_user_login.html # StyleSheet
{ :regexp=>/<link href="custom_template\/[\d]+\/wcStyle\.css" type="?text\/css"? rel="?stylesheet"?>/i },

]

end

