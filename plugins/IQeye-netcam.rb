##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated version detection
##
Plugin.define "IQeye-Netcam" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.2"
description "IQeye netcam web interface"

# 5 results for intitle:"IQeye302 | IQeye303 | IQeye601 | IQeye602 | IQeye603" intitle:"Live Images" @ 2010-07-11
examples %w|
ocwx.com
161.53.240.140
203.122.250.159
|

matches [

# Default title
{ :regexp=>/<title>IQeye[^:]*: Live Images[^<]*<\/title>/ },

]

def passive
	m=[]

	# Model detection # Default title
	if @body =~ /<title>IQeye([^:]+): Live Images[^<]*<\/title>/i
		model=@body.scan(/<title>IQeye([^:]+): Live Images[^<]*<\/title>/i)
		m << { :model=>model }
	end

	m

end

end

