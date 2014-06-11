##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "activeWeb-Content-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-25
version "0.1"
description "Content Server is a comprehensive, scalable content management platform for professional demands. It combines editorial system, website management and development environment for Web applications in one package. - Homepage: http://www.active-web.de/"

# ShodanHQ results as at 2011-03-25 #
# 19 for X-AwCache



# Matches #
matches [

# Version Detection # HTML Comment
{ :version=>/<!--[\s]+page generated with activeWeb contentserver R([\d\.]+)/ },
{ :version=>/<!--[\s]+activeWeb cache extension R([\d\.]+)/ },

# HTML Comment
{ :text=>'<!-- AWNOCACHEBEGIN__AWNOCACHEBEGIN__AWNOCACHEBEGIN__AWNOCACHEBEGIN__AWNOCACHEBEGIN -->' },

]

# Passive #
def passive
	m=[]

	# X-AwCache-* HTTP Server Header
	m << { :name=>"X-AwCache-FollowUp Header" } unless @headers["x-awcache-followup"].nil?
	m << { :name=>"X-AwCache-Command Header" } unless @headers["x-awcache-command"].nil?

	# Technology Detection
	m << { :string=>@headers["x-awcache-scripttechnology"].to_s } unless @headers["x-awcache-scripttechnology"].nil?

	# Return passive matches
	m

end

end

