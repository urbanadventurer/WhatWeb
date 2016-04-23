##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IBM-WebSphere-DataPower" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-08
version "0.1"
description "IBM WebSphere DataPower SOA Appliances are purpose-built, easy-to-deploy network devices that simplify, help secure, and accelerate XML and Web service deployments"
website "https://www-01.ibm.com/software/integration/datapower/"

# ShodanHQ results as at 2012-06-08 #
# 287 for X-Backside-Transport



# Matches #
matches [

# X-Backside-Transport
{ :search=>"headers[x-backside-transport]", :string=>/(FAIL|OK)/ },

]

end

