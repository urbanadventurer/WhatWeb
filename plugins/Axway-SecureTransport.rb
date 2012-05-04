##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Axway-SecureTransport" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-24
version "0.1"
description "Axway SecureTransport is a secure, multi-protocol managed file transfer solution - Homepage: http://www.axway.com/products-solutions/mft/gateways/securetransport"

# ShodanHQ results as at 2012-03-24 #
# 126 for SecureTransport

# Google results as at 2012-03-24 #
# 15 for intitle:"Welcome to SecureTransport"

# Dorks #
dorks [
'intitle:"Welcome to SecureTransport"'
]

# Examples #
examples %w|
12.180.115.182
129.33.19.135
216.190.97.20
204.254.175.102
58.246.137.6
195.36.116.28
159.240.5.84
st.geisinger.org
mft.adaweb.net
ns1.tensilica.com
https://exftpp.symantec.com/
https://valicertext.roche.com/
https://file.callawaygolf.com/
https://sftp.kingcounty.gov/
https://st.ig.com.au/
https://sft.sso.sas.com/
https://sftna.xerox.com/
https://ftp.ameriben.com/
https://tst-west.sonyusa.com/
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^SecureTransport\/([^\s]+)/ },

# Login Page # HTML Comment
{ :text=>'<!-- /application.bar -->' },

# Title
{ :certainty=>75, :text=>'<title>Welcome to SecureTransport</title>' },

]

end

