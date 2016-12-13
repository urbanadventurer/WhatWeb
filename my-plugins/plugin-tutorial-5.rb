##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
Plugin.define "Plugin-Tutorial-5" do
author "Your preferred name <email@address>" # 1999-12-31
version "0.1"
description "GenericRouter is a home router using the ARM processor and busybox Linux."
website "http://example.com/"


# ShodanHQ results as at 1999-12-31 #
# 1,234 for GenericRouter

# Matches #
matches [

	# Title
	{ :text => "<title>GenericRouter</title>" },

	# The www-authenticate message
	{ :search => "headers[www-authenticate]", :text => 'Basic realm="GenericRouter"' },

	# Check MD5sum hashes of images to detect the exact version
	# In aggressive mode 3 these will be checked only if this plugin already matches
	# In aggressive mode 4 these will be checked anyway
	{ :model => 'gsl2540b', :md5 => "d076eed06cafe1e4a74f83c7fdfe2e67", :url => '/generic/images/gsl2540b.jpg' },
	{ :model => 'gsl2640b', :md5 => "01aa666a65a72bb4ab0deadbeef525f4", :url => '/generic/images/gsl2640b.jpg' },
	{ :model => 'ggl3420', :md5 => "c3bb6c8124fe7106339cde087da6bb30", :url => '/generic/images/ggl3420.jpg' },
	{ :model => 'gwl2100ap', :md5 => "fa6350a0feedf00d9651c9aaf05f2187", :url => '/generic/images/gwl2100ap.jpg' },
	{ :model => 'gwl2230ap', :md5 => "71c307b6d7d82eeab5babe23c1ff41a9", :url => '/generic/images/gwl2230ap.jpg' },
	{ :model => 'gwl2700ap', :md5 => "3573c663c0ffeec53c0886518045a6f3", :url => '/generic/images/gwl2700ap.jpg' },
	
] 

end
