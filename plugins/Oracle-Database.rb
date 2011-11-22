##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-Database" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "Oracle Database - Homepage: http://www.oracle.com/technetwork/database/enterprise-edition/overview/index.html"
# More Info: http://www.oracle.com/technetwork/database/features/xmldb/index.html

# ShodanHQ results as at 2011-11-22 #
# 185 for Oracle XML DB/Oracle Database

# Examples #
examples %w|
82.196.46.76
195.88.249.66
88.41.181.66
178.237.185.221
217.128.76.87
80.254.178.172
213.25.91.164
|

# Matches #
matches [

# HTTP Header # Server
{ :search=>"headers[server]", :regexp=>/^Oracle XML DB\/Oracle Database$/, :module=>"Oracle XML DB" },

]

end

