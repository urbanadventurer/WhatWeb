##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "TMSoft-MyAuth-Gateway" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.2"
description "MyAuth Gateway 3 is a software for the administration of users to providers of advanced networks, enabling full management of customers, access users, groups, bandwidth control, with administrative access level and access logs of actions of technical support for complete control and ticket, statistics and central billing system via bank transfer of the major national banks. [Translated from Portuguese]"
website "http://www.myauth.com.br/?console=myauth3_info&site=myauth3"

# About 6144 ShodanHQ results for "X-Manager-By:"
# About 4794 ShodanHQ results for "X-Powered-By: TMSoft MyAuth Gateway"

matches [
	# Cookie
	{ :version=>/MyAuth([0-9]{1})=[a-z0-9]{26}/, :search=>"headers[set-cookie]" },
	
	# X-Powered-By
	{ :version=>/TMSoft MyAuth Gateway ([^\s^\r^\n]+)/, :search=>"headers[x-powered-by]" },
	
	# X-Manager-By
	{ :version=>/MyAuth Gateway ([^\s]+)/, :search=>"headers[x-manager-by]" },

]

# Passive # HTTP Header
def passive
	m=[]
	
	# X-Software-*
	if @headers["x-software-info"] =~ /MyAuth Gateway/ and @headers["x-software-owner"] =~ /Patrick Brandao, contato@tmsoft.com.br/

		m << { :name=>"X-Software HTTP Headers" }
		m << { :version=>@headers["x-software-info"].scan(/MyAuth Gateway ([\d\.]+), TMSoft Solucoes \(www.tmsoft.com.br\)/) } if @headers["x-software-info"] =~ /MyAuth Gateway ([\d\.]+), TMSoft Solucoes \(www.tmsoft.com.br\)/
		m << { :version=>@headers["x-software-version"].scan(/([^\r^\n]*)/) } if @headers["x-software-version"] =~ /([^\r^\n]*)/

	end

	m

end

end

