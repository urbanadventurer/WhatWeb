##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TMSoft-MyAuth-Gateway" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.1"
description "MyAuth Gateway 3 is a software for the administration of users to providers of advanced networks, enabling full management of customers, access users, groups, bandwidth control, with administrative access level and access logs of actions of technical support for complete control and ticket, statistics and central billing system via bank transfer of the major national banks. [Translated from Portuguese] - homepage: http://www.myauth.com.br/?console=myauth3_info&site=myauth3"

# About 6144 ShodanHQ results for "X-Manager-By:"
# About 4794 ShodanHQ results for "X-Powered-By: TMSoft MyAuth Gateway"
examples %w|
186.194.3.225
186.200.70.130
187.62.107.141
187.63.203.62
187.111.193.35
189.17.122.162
189.39.108.156
189.42.251.108
189.53.131.252
189.84.120.251
189.39.106.237
189.39.107.138
189.39.108.77
200.192.146.116
200.192.147.216
200.192.149.2
200.192.153.240
201.39.19.152
201.48.39.5
201.56.234.116
|

# Passive # HTTP Header
def passive
	m=[]

	# Cookie
	m << { :version=>@meta["set-cookie"].scan(/MyAuth([0-9]{1})=[a-z0-9]{26}/) } if @meta["set-cookie"] =~ /MyAuth([0-9]{1})=[a-z0-9]{26}/

	# X-Powered-By
	m << { :version=>@meta["x-powered-by"].scan(/TMSoft MyAuth Gateway ([^\s^\r^\n]+)/) } if @meta["x-powered-by"] =~ /TMSoft MyAuth Gateway ([^\s^\r^\n]+)/

	# X-Manager-By
	m << { :version=>@meta["x-manager-by"].scan(/MyAuth Gateway ([^\s]+)/) } if @meta["x-manager-by"] =~ /MyAuth Gateway ([^\s]+)/

	# X-Software-*
	if @meta["x-software-info"] =~ /MyAuth Gateway/ and @meta["x-software-owner"] =~ /Patrick Brandao, contato@tmsoft.com.br/

		m << { :name=>"X-Software HTTP Headers" }
		m << { :version=>@meta["x-software-info"].scan(/MyAuth Gateway ([\d\.]+), TMSoft Solucoes \(www.tmsoft.com.br\)/) } if @meta["x-software-info"] =~ /MyAuth Gateway ([\d\.]+), TMSoft Solucoes \(www.tmsoft.com.br\)/
		m << { :version=>@meta["x-software-version"].scan(/([^\r^\n]*)/) } if @meta["x-software-version"] =~ /([^\r^\n]*)/

	end

	m

end

end

