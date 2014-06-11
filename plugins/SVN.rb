##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SVN" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.1"
description "SVN HTTP header."

# About 85500 ShodanHQ results for "server: SVN" @ 2010-10-30


# HTTP Header
def passive
	m=[]

	m << { :version=>@headers["server"].scan(/[^\r^\n]*SVN\/([^\r^\n^\s]*)/) } if @headers["server"] =~ /[^\r^\n]*SVN\/([^\r^\n^\s]*)/

	m

end

end

