##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-Internet-Application-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "Oracle iAS (Internet Application Server) - Homepage: http://www.oracle.com/technetwork/middleware/ias/index.html"
# More Info: https://en.wikipedia.org/wiki/Oracle_Application_Server

# ShodanHQ results as at 2011-11-22 #
# 693 for Oracle9iAS
#  99 for Oracle9iAS-Web-Cache

# Examples #
examples %w|
88.41.52.83
65.102.57.171
142.169.28.220
202.138.180.163
82.99.173.30
217.74.116.41
63.243.149.51
221.148.247.27
192.158.46.72
221.186.190.146
203.77.6.147
195.194.143.22
88.41.52.83
196.200.36.130
65.102.57.171
|

# Matches #
matches [

# HTTP Header # Server # Version Detection
{ :search=>"headers[server]", :version=>/^Oracle9iAS\/([^\s]+)/ },
{ :search=>"headers[server]", :version=>/^Oracle9iAS \(([^\s^\)]+)\)/ },

# HTTP Header # Server # OracleAS-Web-Cache Detection
{ :search=>"headers[server]", :module=>/^Oracle9iAS.+ (Oracle9iAS-Web-Cache\/[^\s]+)/ },

]

end

