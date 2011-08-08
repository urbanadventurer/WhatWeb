##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Internet-Cluster-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-07
version "0.1"
description "The Internet Cluster Manager (ICM) lets you use Domino clusters to provide failover and workload balancing to HTTP clients. - Homepage: http://www-12.lotus.com/ldd/doc/domino_notes/rnext/help6_admin.nsf/f4b82fbb75e942a6852566ac0037f284/36fd13678096637585256c1d0039a59b?OpenDocument"

# ShodanHQ results as at 2011-06-07 #
# 250 for Internet Cluster Manager

# Examples #
examples %w|
150.164.68.10
198.78.253.171
64.115.7.189
212.202.163.51
200.186.251.141
212.79.53.37
200.40.175.226
200.144.7.63
109.228.5.189
193.11.38.212
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Internet Cluster Manager Ver\. ([^\s]+)$/) } if @headers["server"] =~ /^Internet Cluster Manager Ver\. ([^\s]+)$/

	# Return passive matches
	m
end

end

