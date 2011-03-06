##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Nucleus" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.1"
description "Nucleus Webserver"

# About 146037 ShodanHQ results for "server: Nucleus" @ 2010-10-26
examples %w|
187.112.244.71
85.104.131.161
222.254.68.151
180.193.43.23
190.11.69.109
180.193.30.222
187.13.114.151
113.167.204.3
85.100.36.154
200.101.215.116
|

# HTTP Header
def passive
	m=[]

	# Server
	m << { :version=>@meta["server"].to_s.scan(/^[\s]*Nucleus\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /^[\s]*Nucleus\/([^\s^\r^\n]+)/i

	m

end

end

