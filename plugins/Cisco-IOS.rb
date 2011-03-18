##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Removed redundant capitalized @meta["Server"] match
##
# Version 0.3 2011-03-16 by Andrew Horton
# Added cisco model detection

Plugin.define "Cisco-IOS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.3"
description "Cisco IOS (originally Internetwork Operating System) is the software used on the vast majority of Cisco Systems routers and current Cisco network switches. (Earlier switches ran CatOS.) IOS is a package of routing, switching, internetworking and telecommunications functions tightly integrated with a multitasking operating system. - More info: http://en.wikipedia.org/wiki/Cisco_IOS"

# ShodanHQ results as at 2010-10-26 #
# 284,567 for "server: cisco-IOS"

# Examples #
examples %w|
96.61.214.8
122.227.189.246
199.2.209.61
202.6.154.2
216.244.169.38
199.216.192.128
91.206.162.13
95.14.189.62
65.61.46.1
195.133.224.193
|

matches [
{ :model=>/\ssdmconfig-([^\.]+).cfg/}, 
{ :model=>/\sc(\d+)(nm)?[^\-]*-\S+-mz\S+\.bin/}, 
{ :string=>"Dir",     :regexp=>/<input type="hidden" name="DIRINFO" value="\s+Directory of archive:\// },
{ :string=>"DirFail", :regexp=>/<input type="hidden" name="DIRINFO" value="\s*(Command authorization failed|% Authorization failed)/ }
]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"].to_s =~ /^[\s]*cisco-IOS/

	# Return passive matches
	m

end

end

