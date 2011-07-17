##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SpirePRO-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-16
version "0.1"
description "Custom CMS from Boston web design and hosting company 1stOmni - http://www.1stomni.com/"

# ShodanHQ results as at 2011-05-16 #
# 8 for SpirePRO CMS

# Examples #
examples %w|
www.maidpro.com
www.olympus-ims.comen
www.blueq.com
66.151.177.67
66.151.177.55
66.151.177.160
66.151.177.159
66.151.177.74
66.151.177.36
66.151.177.104
|

# Matches #
matches [

# JavaScript
{ :text=>'<script xmlns:a="http://www.1stomni.com/spire/aml" type="text/javascript"' },

# Meta Spire-Last-Modified
{ :text=>'<meta name="Spire-Last-Modified" content="' },

# Spire-Editor
{ :regexp=>/<meta name="Spire-Editor" content="([^"]+)">/ },

]

# Passive #
def passive
	m=[]

	# x-generator header
	m << { :string=>@meta["x-generator"].scan(/^SpirePRO CMS v([\d\.]+ \(Microkernel v[\d]+; CMS Server v[\d]+\)) /) } if @meta["x-generator"] =~ /^SpirePRO CMS v([\d\.]+ \(Microkernel v[\d]+; CMS Server v[\d]+\)) /

	# generator header
	m << { :string=>@meta["generator"].scan(/^SpirePRO CMS v([\d\.]+ \(Microkernel v[\d]+; CMS Server v[\d]+\)) /) } if @meta["generator"] =~ /^SpirePRO CMS v([\d\.]+ \(Microkernel v[\d]+; CMS Server v[\d]+\)) /

	# Return passive matches
	m
end

end

