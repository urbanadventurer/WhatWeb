##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LPSE" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-29
version "0.1"
description "Electronic Procurement Service (Layanan Pengadaan Secara Elektronik - LPSE) - established by the Indonesian Ministry, Institution, College and state/local governments to facilitate procurement of government goods and services electronically. - Homepage: http://www.lkpp.go.id/v2/content.php?mid=2580235452"

# ShodanHQ results as at 2012-02-29 #
# 197 for eproc/app

# Google results as at 2012-02-29 #
# 589 for inurl:"/eproc/app"

# Dorks #
dorks [
'inurl:"/eproc/app"'
]

# Examples #
examples %w|
202.4.179.220
202.152.21.230
202.134.5.253
118.97.42.190
222.124.152.170
118.98.65.60
175.103.44.6
180.249.189.67
118.97.212.236
lpse.pasamanbaratkab.go.id
lpse.depnakertrans.go.id
lpse.malukuprov.go.id
lpse.jabarprov.go.id
eproc-lpse.pln.co.id
lpse.dpr.go.id
lpse.depkeu.go.id
|

# Matches #
matches [

# HTTP Location Header
{ :search=>"headers[location]", :regexp=>/^(https?:\/\/[^\/]+)?\/eproc\/app/ },

# StyleSheet
{ :text=>'<link rel="stylesheet" type="text/css" href="/eproc/assets/application.css"/>' },

]

end

