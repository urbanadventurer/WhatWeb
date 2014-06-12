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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP x-powered-by
	m << { :version=>@headers["x-powered-by"].scan(/Lussumo Vanilla ([^\s]+)/) } if @headers["x-powered-by"] =~ /Lussumo Vanilla ([^\s]+)/

	# Return passive matches
	m
end

end

