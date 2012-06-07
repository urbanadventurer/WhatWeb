##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IBM-WebSphere-DataPower" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-08
version "0.1"
description "IBM WebSphere DataPower SOA Appliances are purpose-built, easy-to-deploy network devices that simplify, help secure, and accelerate XML and Web service deployments - Homepage: https://www-01.ibm.com/software/integration/datapower/"

# ShodanHQ results as at 2012-06-08 #
# 287 for X-Backside-Transport

# Examples #
examples %w|
69.60.85.80
12.45.86.182
192.175.201.68
170.224.52.22
110.173.158.121
12.149.175.59
195.245.180.128
162.115.99.52
162.115.227.200
206.108.41.136
162.115.227.200
162.115.99.54
162.115.227.137
177.67.249.179
137.188.82.211
65.110.169.49
162.115.99.57
162.115.99.98
137.188.96.51
|

# Matches #
matches [

# X-Backside-Transport
{ :search=>"headers[x-backside-transport]", :string=>/(FAIL|OK)/ },

]

end

