##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "SpirePRO-CMS"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-16
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
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

# x-generator header
{ :string=>/^SpirePRO CMS v([\d\.]+ \(Microkernel v[\d]+; CMS Server v[\d]+\)) /, :search=>"headers[x-generator]" },

# generator header
{ :string=>/^SpirePRO CMS v([\d\.]+ \(Microkernel v[\d]+; CMS Server v[\d]+\)) /, :search=>"headers[generator]" },

# SpirePRO CMS in any header
{ :regexp=>/^SpirePRO CMS/, :search=>"headers" },

]

end

