##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "SmartCDS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-06
version "0.2"
description "SmartCDS (Content Delivery Server) hardware [Japanese]"
website "http://www.globaldawin.com/product/smartcds.php3"

# ShodanHQ results as at 2011-07-06 #
# 420 for SmartCDS
#  17 for X-SmartCDS-Error

# Matches #
matches [

# Error Page
{ :text=>'<img border=0 src="http://www.globaldawin.com/capcds/refresh.gif" width="13" height="16"' },

# Server Header
{ :regexp=>/^smartcds/, :search=>"headers[server]" },

# Version Detection # Server Header
{ :version=>/^smartcds\/([^\s]+)/, :search=>"headers[server]" },

# Version Detection # SmartCDS Header
{ :version=>/^Version:([^\s]+)$/, :search=>"headers[smartcds]" },

# Error Detection # X-SmartCDS-Error Header
{ :string=>/^(.*)$/, :search=>"headers[x-smartcds-error]" },

]

end

