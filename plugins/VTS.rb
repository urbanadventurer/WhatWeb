##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VTS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-02
version "0.1"
description "VTS Server"

# 123 ShodanHQ results for Server: VTS
# 103 ShodanHQ results for Set-Cookie: VTS=
examples %w|
71.42.172.182
99.167.253.150
142.176.153.126
166.139.45.60
216.171.226.110
|

matches [

# Error Page # Default HTML
{ :status=>401, :regexp=>/<html>\r\n<head>\r\n<title>Error Message<\/title>\r\n<link rel="stylesheet" href="\/VTS.css">\r\n\r\n<\/head>\r\n<body class=error>\r\n<h1>Error Message<\/h1>\r\n<p>Error Code 401.\r\n<p>Message: Unauthorized.\r\n<p>Description: 401 = No permission -- see authorization schemes./ },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/VTS ([\d\.]+)/) } if @meta["server"] =~ /VTS ([\d\.]+)/

	# Version Detection # HTTP Set-Cookie Header
	m << { :version=>@meta["set-cookie"].scan(/^VTS=([\d\.]+);Version=1;Path=\//) } if @meta["set-cookie"] =~ /^VTS=([\d\.]+);Version=1;Path=\//

	m

end

end

