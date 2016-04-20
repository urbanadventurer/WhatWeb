##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Internet-Cluster-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-07
version "0.2"
description "The Internet Cluster Manager (ICM) lets you use Domino clusters to provide failover and workload balancing to HTTP clients."
website "http://www-12.lotus.com/ldd/doc/domino_notes/rnext/help6_admin.nsf/f4b82fbb75e942a6852566ac0037f284/36fd13678096637585256c1d0039a59b?OpenDocument"

# ShodanHQ results as at 2011-06-07 #
# 250 for Internet Cluster Manager

matches [

	{ :regexp=>/^Internet Cluster Manager/, :search=>"headers[server]" },
	# Version Detection # HTTP Server Header
	{ :version=>/^Internet Cluster Manager Ver\. ([^\s]+)$/, :search=>"headers[server]" },
	
]

end

