##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sitecom-NAS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-07
version "0.1"
description "Sitecom Home Storage Center - Network Attached Storage (NAS)"
website "http://www.sitecom.com/home-storage-center/p/863"

# Default Login # sitecom

# ShodanHQ results as at 2012-09-07 #
# 425 for WWW-Authenticate Basic realm SITECOM LOGIN Enter Password



# Matches #
matches [

# WWW-Authenticate Header
# Certainty=>75 because I don't own one and can't confirm this is in fact a
# Sitecom NAS and not another of their products
{ :certainty=>75, :search=>"headers[www-authenticate]", :text=>'Basic realm="SITECOM LOGIN Enter Password (default is sitecom)' },

]

end

