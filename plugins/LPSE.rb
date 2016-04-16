##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LPSE" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-29
version "0.1"
description "Electronic Procurement Service (Layanan Pengadaan Secara Elektronik - LPSE) - established by the Indonesian Ministry, Institution, College and state/local governments to facilitate procurement of government goods and services electronically."
website "http://www.lkpp.go.id/v2/content.php?mid=2580235452"

# ShodanHQ results as at 2012-02-29 #
# 197 for eproc/app

# Google results as at 2012-02-29 #
# 589 for inurl:"/eproc/app"

# Dorks #
dorks [
'inurl:"/eproc/app"'
]



# Matches #
matches [

# HTTP Location Header
{ :search=>"headers[location]", :regexp=>/^(https?:\/\/[^\/]+)?\/eproc\/app/ },

# StyleSheet
{ :text=>'<link rel="stylesheet" type="text/css" href="/eproc/assets/application.css"/>' },

]

end

