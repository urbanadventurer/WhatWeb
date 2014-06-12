##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SmugMug" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "SmugMug is a paid digital photo sharing website - Homepage: http://www.smugmug.com/"

# ShodanHQ results as at 2011-03-16 #
# 246 for x-powered-by smugmug



# Passive #
def passive
	m=[]

	# Version Detection # X-Powered-By
	m << { :version=>@headers["x-powered-by"].scan(/^SmugMug\/([\d\.]+)$/i) } if @headers["x-powered-by"] =~ /^SmugMug\/([\d\.]+)$/i

	# X-SmugMug-Values
	m << { :name=>"X-SmugMug-Values HTTP Header" } unless @headers["x-smugmug-values"].nil?

	# Return passive matches
	m
end

end


