##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "USP-Secure-Entry-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-25
version "0.1"
description "United Security Providers (USP; previously known as Tetrade) Secure Entry Server (SES) Web Application Firewall (WAF) - Homepage: http://www.united-security-providers.com/"

# The United Security Providers (USP; previously known as Tetrade) components Secure Entry Server (SES) and Secure Login Service (SLS) share their tasks in order to adhere to the principles of separation of powers. The task of the SES is to recognize non-authenticated users and to ensure that they are authenticated by the SLS (Access Control Enforcement Function). The task of the SLS is to perform the authentication (Authentication and Access Control Decision Function). The communication between SES and SLS is based on custom HTTP headers. The SES sends the desired user login type to the SLS which performs the authentication. Once the login is completed, the SLS signals the success or failure of the process back to the SES. According to this, the SES determines the access rights of the user.

# ShodanHQ results as at 2011-08-25 #
# 56 for Secure Entry Server

# Examples #
examples %w|
193.5.56.67
193.201.123.145
194.230.108.105
68.178.167.107
194.230.108.71
193.201.123.146
193.201.123.254
194.230.108.81
87.236.200.18
195.65.87.164
|

# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Secure Entry Server$/ },

]

end

