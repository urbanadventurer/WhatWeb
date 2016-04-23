##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "SAP-NetWeaver" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-10
version "0.2"
description "SAP NetWeaver provides the technical foundation for SAP applications. In addition, it delivers a portfolio of enterprise technology that allows you to extend your applications to reach more people and to adopt new processes, devices, and consumption models."
website "http://www.sap.com/platform/netweaver/index.epx"
# More info: http://en.wikipedia.org/wiki/SAP_NetWeaver_Application_Server

# Google results as at 2011-03-10 #
# 100 results for intitle:"Logon - SAP Web Application Server"

# ShodanHQ results as at 2011-03-10 #
# 710 for SAP Web Application Server
# 363 for SAP netweaver
# 619 for SAP J2EE Engine

# Dorks #
dorks [
'intitle:"Logon - SAP Web Application Server"'
]

matches [
	# Application Server
	{ :name=>"HTTP Server Header", :regexp=>/^SAP (Web|NetWeaver)/, :search=>"headers[server]" },

	# Version Detection
	{ :string=>/^SAP (Web|NetWeaver) Application Server [\/]?[\ ]?[\(]?([^\)^\r^\n]+)[\)]?/, :offset=>1, :search=>"headers[server]" },

	# J2EE Engine
	{ :module=>"J2EE", :version=>/^SAP J2EE Engine\/([\d\.]{1,4})/, :search=>"headers[server]" },

]

end

