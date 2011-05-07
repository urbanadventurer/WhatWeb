##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Lussumo-Vanilla" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-07
version "0.1"
description "A free, open-source, standards-compliant discussion forum for the web.  - Homepage: http://code.google.com/p/lussumo-vanilla/"

# ShodanHQ results as at 2011-03-13 #
# 74 for Lussumo Vanilla

# Google results as at 2011-05-07 #
# 20 for inurl:"people.php?PageAction=SignOutNow"

# Dorks #
dorks [
'inurl:"people.php?PageAction=SignOutNow"'
]

# Examples #
examples %w|
www.redskiesguild.com/vanilla12beta/
shoutland.com
72.47.215.98
83.133.121.91
69.89.12.233
12.139.75.89
72.249.114.81
64.128.235.230
184.106.223.64
195.112.128.210
62.24.66.125
qasr.com.au/discuss/people.php
www.acdcfans.net/forum/people.php
https://www.basesoft.se/myvanilla/people.php
notalentcunt.com/people.php
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP x-powered-by
	m << { :version=>@meta["x-powered-by"].scan(/Lussumo Vanilla ([^\s]+)/) } if @meta["x-powered-by"] =~ /Lussumo Vanilla ([^\s]+)/

	# Return passive matches
	m
end

end

