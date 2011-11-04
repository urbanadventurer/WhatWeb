##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-11-04 #
# Updated matches to use :search instead of passive[]
##
Plugin.define "Bitrix-Site-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-04
version "0.1"
description "Website management, e-commerce and e-marketing solution that delivers extreme value in performance, functionality, and ease-of-use. - Homepage: http://www.bitrixsoft.com/"

# ShodanHQ results as at 2011-05-04 #
# 226 for B-Powered-By
# 225 for B-Powered-By Bitrix SM
# 4,064 for X-Powered-CMS

# Examples #
examples %w|
www.1c-bitrix-ua.com
80.250.160.250
80.78.194.252
64.191.50.24
95.141.136.156
188.133.185.194
217.106.236.131
194.85.89.116
80.71.44.50
212.193.230.240
208.109.106.151
80.84.112.36
168.143.31.170
77.221.152.58
79.135.228.66
87.242.99.80
91.199.211.47
95.142.83.101
212.59.97.138
78.110.54.10
|

# Matches #
matches [

# P3P
{ :search=>"headers[p3p]", :name=>"P3P Header", :regexp=>/^policyref="\/bitrix\/p3p\.xml", CP="NON DSP COR CUR ADM DEV PSA PSD OUR UNR BUS UNI COM NAV INT DEM STA"$/ },

# Cookies
{ :search=>"headers[set-cookie]", :name=>"BITRIX_SM_SALE_UID Cookie", :regexp=>/BITRIX_SM_SALE_UID=[\d]+;/ },
{ :search=>"headers[set-cookie]", :name=>"BITRIX_SM_GUEST_ID Cookie", :regexp=>/BITRIX_SM_GUEST_ID=[\d]+;/ },
{ :search=>"headers[set-cookie]", :name=>"BITRIX_SM_LAST_VISIT Cookie", :regexp=>/BITRIX_SM_LAST_VISIT=/ },
{ :search=>"headers[set-cookie]", :name=>"BITRIX_SM_BANNERS Cookie", :regexp=>/BITRIX_SM_BANNERS=/ },

# X-Powered-CMS
{ :search=>"headers[x-powered-cms]", :name=>"X-Powered-CMS Header", :regexp=>/^Bitrix Site Manager \(/ },

# B-Powered-By
{ :search=>"headers[b-powered-by]", :name=>"B-Powered-By Header", :regexp=>/^Bitrix SM \(/ },

# Version Detection # B-Powered-By
{ :search=>"headers[b-powered-by]", :name=>"B-Powered-By Header", :version=>/^Bitrix SM\/([\d\.]+) \(/ },

]

end

