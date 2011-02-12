##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ruby" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.1"
description "Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write. - homepage: http://www.ruby-lang.org/"

# About 15698 ShodanHQ results for "server: ruby" @ 2010-10-26
examples %w|
219.118.99.129
12.49.88.2
68.142.82.239
89.46.128.51
75.101.162.117
93.159.43.99
213.132.96.34
78.159.108.70
134.106.62.56
212.75.96.249
|

# HTTP Header
def passive
	m=[]

	# Server # Version Detection
	m << { :version=>@meta["server"].to_s.scan(/[^\r^\n]*Ruby\/([^\s^\r^\n]+)/).to_s } if @meta["server"].to_s =~ /[^\r^\n]*Ruby\/([^\s^\r^\n]+)/

	m

end

end

