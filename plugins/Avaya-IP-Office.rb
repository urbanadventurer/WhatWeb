##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Replaced passive function with matches
##
Plugin.define "Avaya-IP-Office" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
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

