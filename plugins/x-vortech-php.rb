##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X-Vortech-PHP" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.1"
description "X-Vortech-PHP HTTP header."

# About 440 ShodanHQ results for "X-Vortech-PHP" @ 2010-10-30


# HTTP Header
def passive
	m=[]

	m << { :version=>@headers["x-vortech-php"].to_s } unless @headers["x-vortech-php"].nil?

	m

end

end

