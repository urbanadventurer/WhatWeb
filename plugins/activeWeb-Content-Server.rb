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

# Examples #
examples %w|
137.226.107.17
137.226.107.11
137.226.107.16
137.226.107.31
137.226.107.22
137.226.107.23
137.226.107.12
137.226.107.45
137.226.107.25
137.226.107.41
137.226.107.18
137.226.107.21
137.226.107.15
137.226.107.28
137.226.107.36
137.226.107.35
137.226.107.26
137.226.107.14
194.124.202.224
www.gesund-in-hessen.info
www.familienatlas.de
www.exzellenz.rwth-aachen.de
|

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
	m << { :name=>"X-AwCache-FollowUp Header" } unless @meta["x-awcache-followup"].nil?
	m << { :name=>"X-AwCache-Command Header" } unless @meta["x-awcache-command"].nil?

	# Technology Detection
	m << { :string=>@meta["x-awcache-scripttechnology"].to_s } unless @meta["x-awcache-scripttechnology"].nil?

	# Return passive matches
	m

end

end

