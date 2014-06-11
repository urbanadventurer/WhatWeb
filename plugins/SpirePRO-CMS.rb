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
	m << { :string=>@headers["x-generator"].scan(/^SpirePRO CMS v([\d\.]+ \(Microkernel v[\d]+; CMS Server v[\d]+\)) /) } if @headers["x-generator"] =~ /^SpirePRO CMS v([\d\.]+ \(Microkernel v[\d]+; CMS Server v[\d]+\)) /

	# generator header
	m << { :string=>@headers["generator"].scan(/^SpirePRO CMS v([\d\.]+ \(Microkernel v[\d]+; CMS Server v[\d]+\)) /) } if @headers["generator"] =~ /^SpirePRO CMS v([\d\.]+ \(Microkernel v[\d]+; CMS Server v[\d]+\)) /

	# Return passive matches
	m
end

end

