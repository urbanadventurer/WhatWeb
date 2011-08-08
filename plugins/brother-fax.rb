##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Brother-Fax" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-14
version "0.1"
description "Brother fax web interface - homepage: http://www.brother.com/"
# Default login: Admin/Access

# ShodanHQ results as at 2011-05-14 #
# 12,539 for Debut
#  7,950 for Debut -printer

# Google results as at 2011-05-14 #
# 84 for intitle:"brother mfc" inurl:"/main/main.html"

# Dorks #
dorks [
'intitle:"brother mfc" inurl:"/main/main.html"'
]

# Examples #
examples %w|
70.89.9.195
128.119.130.18
128.250.167.204
129.25.6.46
129.107.93.5
129.237.170.148
130.111.215.98
130.158.27.156
133.5.71.163
134.34.71.47
141.2.161.110
www.curee.info
www.xxjfnk.com
cascade.engr.utk.edu
astro14.astronevis.columbia.edu
|

# Matches #
matches [

# Model Detection # Default Title
{ :model=>/<TITLE>\nBrother (MFC-[\dA-Z]+)\n<\/TITLE>/ },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	# This header is also used by some brother printers
	m << { :certainty=>25, :version=>@meta["server"].scan(/^[Dd]ebut\/([\d\.]+)$/) } if @headers["server"] =~ /^[Dd]ebut\/([\d\.]+)$/

	# Return passive matches
	m
end
end

