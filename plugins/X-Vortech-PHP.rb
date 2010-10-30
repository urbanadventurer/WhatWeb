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
examples %w|
216.81.70.129
216.157.151.216
216.81.72.225
216.157.146.105
216.157.155.176
216.81.71.167
216.81.72.198
216.81.70.201
216.157.150.15
216.157.154.194
|

# HTTP Header
def passive
	m=[]

	m << { :version=>@meta["x-vortech-php"].to_s } unless @meta["x-vortech-php"].nil?

	m

end

end

