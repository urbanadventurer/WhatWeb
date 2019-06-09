##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "M2Soft-RDServer"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2012-06-03
]
version "0.1"
description "M2Soft Report Designer Server - reporting tool"
website "http://www.m2soft.co.kr/english/reporting-tool.asp"

# ShodanHQ results as at 2012-06-03 #
# 5 for RDServer

# Google results as at 2012-06-03 #
# 13 for intitle:"M2Soft Report Designer Server" inurl:"RDServer/rdagent.jsp"

# Dorks #
dorks [
'intitle:"M2Soft Report Designer Server" inurl:"RDServer/rdagent.jsp"'
]



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

