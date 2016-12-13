##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Telligent-Community-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.2"
description "Telligent Community (previously known as Community Server) is a community and collaboration software platform developed by Telligent Systems and was first released in 2004. Telligent Community is built on the Telligent Evolution platform, with a variety of core applications running on top of it such as blogs, forums, media galleries, and wikis. Telligent Community is built with ASP.NET, C#, and Microsoft SQL Server. The product used to be named Community Server before being rebranded as part of the 5.0 release."
website "http://telligent.com/products/telligent_community/"

# ShodanHQ results as at 2011-03-15 #
# 658 for communityserver

matches [
	
	# Version Detection # HTTP CommunityServer Header
	{ :version=>/^([\d\.]+)$/, :search=>"headers[communityserver]" },

	# Set-Cookie Header
	{ :regexp=>/^CommunityServer-UserCookie[\d\.]+/, :search=>"headers[set-cookie]", :name=>"Cookies" },

	# Set-Cookie Header
	{ :regexp=>/^CommunityServer-LastVisitUpdated-[\d\.]+/, :search=>"headers[set-cookie]", :name=>"Cookies" },
	
]

end

