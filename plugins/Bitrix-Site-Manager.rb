##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
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
80.250.160.250
80.78.194.252
64.191.50.24
95.141.136.156
188.133.185.194
70.32.97.133
83.167.18.35
217.106.236.131
194.85.89.116
80.71.44.50
82.179.192.82
212.193.230.240
208.109.106.151
80.84.112.36
168.143.31.170
|

# Matches #
matches [

]

# Passive #
def passive
	m=[]

	# P3P
	m << { :name=>"P3P Header" } if @headers["p3p"] =~ /^P3P: policyref="\/bitrix\/p3p\.xml", CP="NON DSP COR CUR ADM DEV PSA PSD OUR UNR BUS UNI COM NAV INT DEM STA"$/

	# Cookies
	m << { :name=>"BITRIX_SM_SALE_UID Cookie" } if @headers["set-cookie"] =~ /BITRIX_SM_SALE_UID=[\d]+;/
	m << { :name=>"BITRIX_SM_GUEST_ID Cookie" } if @headers["set-cookie"] =~ /BITRIX_SM_GUEST_ID=[\d]+;/
	m << { :name=>"BITRIX_SM_LAST_VISIT Cookie" } if @headers["set-cookie"] =~ /BITRIX_SM_LAST_VISIT=/
	m << { :name=>"BITRIX_SM_BANNERS Cookie" } if @headers["set-cookie"] =~ /BITRIX_SM_BANNERS=/

	# X-Powered-CMS
	m << { :name=>"X-Powered-CMS header" } if @headers["x-powered-cms"] =~ /^Bitrix Site Manager \([a-f\d]{32}\)$/

	# B-Powered-By
	m << { :name=>"B-Powered-By Header" } if @headers["b-powered-by"] =~ /^Bitrix SM \([a-f\d]{32}\)$/

	# Version Detection # B-Powered-By
	m << { :version=>@headers["b-powered-by"].scan(/^Bitrix SM\/([\d\.]+) \([a-f\d]{32}\)$/) } if @headers["b-powered-by"] =~ /^Bitrix SM\/([\d\.]+) \([a-f\d]{32}\)$/

	# Return passive matches
	m
end

end

