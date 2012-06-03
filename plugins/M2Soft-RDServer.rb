##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "M2Soft-RDServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-03
version "0.1"
description "M2Soft Report Designer Server - reporting tool - Homepage: http://www.m2soft.co.kr/english/reporting-tool.asp"

# ShodanHQ results as at 2012-06-03 #
# 5 for RDServer

# Google results as at 2012-06-03 #
# 13 for intitle:"M2Soft Report Designer Server" inurl:"RDServer/rdagent.jsp"

# Dorks #
dorks [
'intitle:"M2Soft Report Designer Server" inurl:"RDServer/rdagent.jsp"'
]

# Examples #
examples %w|
128.134.70.102/RDServer/rdagent.jsp
203.246.118.117/RDServer/rdagent.jsp
202.30.48.6:8099/knu/RDServer/rdagent.jsp
report.hi-portal.co.kr/RDServer/rdagent.jsp
rd.edunavi.kr/RDServer/rdagent.jsp
umis.andong.ac.kr:9090/RDServer/rdagent.jsp
152.99.80.235/RDServer/rdagent.jsp
rd.korcham.net/RDServer/rdagent.jsp
rd.stxship.co.kr:8282/RDServer/rdagent.jsp
voc.icseoul.co.kr:8080/erms/RDServer/rdagent.jsp
test.sbc.or.kr/RDServer/rdagent.jsp
utis.uc.ac.kr/RDServer/rdagent.jsp
eanu.andong.ac.kr:8080/umis/RDServer/rdagent.jsp
nis.gnu.ac.kr/RDServer/rdagent.jsp
www.peti.go.kr/RDServer/rdagent.jsp
|

# Matches #
matches [

# Title
{ :text=>'<title>M2Soft Report Designer Server</title>' },

# /RDServer/rdagent.jsp # Version Detection
{ :url=>"/RDServer/rdagent.jsp", :version=>/<font face="Verdana" size=2>\s+<li>Server version : ([^\s]+)/ },

# writereportlog # Header
{ :search=>"headers[writereportlog]", :regexp=>/^FALSE$/ },

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^RDServer\/([^\s]+)$/ },

]

end

