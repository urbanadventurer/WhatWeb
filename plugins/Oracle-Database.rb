##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-Database" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "Oracle Database"
website "http://www.oracle.com/technetwork/database/enterprise-edition/overview/index.html"
# More Info: http://www.oracle.com/technetwork/database/features/xmldb/index.html

# ShodanHQ results as at 2011-11-22 #
# 185 for Oracle XML DB/Oracle Database



# Matches #
matches [

# HTTP Header # Server
{ :search=>"headers[server]", :regexp=>/^Oracle XML DB\/Oracle Database$/, :module=>"Oracle XML DB" },

]

end

