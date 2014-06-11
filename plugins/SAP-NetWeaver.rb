##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SAP-NetWeaver" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-10
version "0.1"
description "SAP NetWeaver provides the technical foundation for SAP applications. In addition, it delivers a portfolio of enterprise technology that allows you to extend your applications to reach more people and to adopt new processes, devices, and consumption models. - Homepage: http://www.sap.com/platform/netweaver/index.epx"
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



# Passive #
def passive
	m=[]

	# Application Server
	if @headers["server"] =~ /^SAP (Web|NetWeaver) Application Server/

		# Server Detection
		m << { :name=>"HTTP Server Header" }

		# Version Detection
		m << { :string=>@headers["server"].scan(/^SAP (Web|NetWeaver) Application Server [\/]?[\ ]?[\(]?([^\)^\r^\n]+)[\)]?/)[0][1] } if @headers["server"] =~ /^SAP (Web|NetWeaver) Application Server [\/]?[\ ]?[\(]?([^\)^\r^\n]+)[\)]?/

	end

	# J2EE Engine
	m << { :module=>"J2EE", :version=>@headers["server"].scan(/^SAP J2EE Engine\/([\d\.]{1,4})/).flatten } if @headers["server"] =~ /^SAP J2EE Engine\/([\d\.]{1,4})/

	# Return passive matches
	m
end

end

