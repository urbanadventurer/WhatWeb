##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Avaya-IP-Office"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-30
  "Andrew Horton", # v0.2 # 2016-04-19 # Replaced passive function with matches. 
]
version "0.2"
description "IP Office is Avaya's telephone system for small and medium enterprises. IP Office systems can be run in several modes."
website "http://marketingtools.avaya.com/knowledgebase/"

# ShodanHQ results as at 2011-05-30 #
# 909 for IPOffice



# Matches #
matches [

	# /ssa/index.html
	{ :text=>'<html><head><title>IP Office System Status</title><style' },

	# Version Detection
	{ :version=>/^IPOffice\/([^\s]+)$/, :search=>"headers[server]" },

	{ :version=>/<title>About IP Office ([^\s^<]+)<\/title>/ },

]

end

