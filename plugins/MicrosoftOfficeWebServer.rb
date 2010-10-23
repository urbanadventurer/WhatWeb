##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MicrosoftOfficeWebServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.1"
description "Microsoft Office Web Server"

# About 233672 ShodanHQ results for MicrosoftOfficeWebServer: @ 2010-10-23
examples %w|
198.106.224.207
198.65.5.115
203.100.252.118
151.205.139.121
64.224.167.249
142.22.48.86
213.8.90.143
216.197.115.57
202.125.164.134
173.213.36.239
|

# Extract version # HTTP Header
def passive
	m=[]
	m << { :version=>@meta["MicrosoftOfficeWebServer"].to_s } unless @meta["MicrosoftOfficeWebServer"].nil?
	m << { :version=>@meta["microsoftofficewebserver"].to_s } unless @meta["microsoftofficewebserver"].nil?
	m
end

end

