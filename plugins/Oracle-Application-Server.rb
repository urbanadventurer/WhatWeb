##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-Application-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "Oracle Application Server - superseded by Oracle iAS (Internet Application Server)"
website "http://www.oracle.com/technetwork/middleware/ias/index.html"
# More Info: https://en.wikipedia.org/wiki/Oracle_Application_Server

# ShodanHQ results as at 2011-11-22 #
# 15,793 for Oracle-Application-Server
# 15,122 for Oracle-Application-Server-10g
#    384 for Oracle-Application-Server-11g



# Matches #
matches [

# HTTP Header # Server
{ :search=>"headers[server]", :string=>/^Oracle-Application-Server-(1[01]g)/ },

# HTTP Header # Server # Version Detection
{ :search=>"headers[server]", :version=>/^Oracle-Application-Server-1[01]g\/([^\s]+)/ },
{ :search=>"headers[server]", :version=>/^Oracle Application Server\/1[01]g \(([^\s^\)]+)\)/ },

# HTTP Header # Server # OracleAS-Web-Cache Detection
{ :search=>"headers[server]", :module=>/^Oracle[ -]Application[ -]Server.+ (OracleAS-Web-Cache-1[01]g\/[^\s]+)/ },

]

end

