##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
	name "Huginn"
	authors [
		"Andrew Horton", # v0.1 # 2021-01-16 # Created plugin
	]
	version "0.1"
	description "Huginn is a system for building agents that perform automated tasks for you online. They can read the web, watch for events, and take actions on your behalf. Huginn's Agents create and consume events, propagating them along a directed graph. Think of it as a hackable version of IFTTT or Zapier on your own server."
	website "https://github.com/huginn/huginn"

	# Dorks # 
	dorks [
	'"Your agents are standing by" "Huginn monitors the world and acts on your behalf." Login Signup',
	]

	# Common port is 3000

	# Matches #
	matches [

		# This searches for the navigation item about 
		{ :text => '<a tabindex="-1" href="https://github.com/huginn/huginn">About</a>' }
	] 

end
