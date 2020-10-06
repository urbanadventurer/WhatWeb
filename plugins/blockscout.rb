##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
	name "BlockScout"
	authors [
		"Andrew Horton", # v0.1 # 2020-10-06 # Created plugin
	]
	version "0.1"
	description "BlockScout provides a comprehensive, easy-to-use interface for users to view, confirm, and inspect transactions on EVM (Ethereum Virtual Machine) blockchains. This includes the POA Network, xDai Chain, Ethereum Classic and other Ethereum testnets, private networks and sidechains. BlockScout is opensource, licensed under GPLv3 and developed with Elixir. Many crypto currencies or tokens use this project."
	website "https://github.com/poanetwork/blockscout/"

	# Dorks # 
	dorks [
	'BlockScout explorer'
	]

	matches [
		{ :name => "footer-info-text", :text => '<p class="footer-info-text">Blockscout is a' },

		{ :name => "input-group", :text => '<div class="input-group" title=\'Search by address, token symbol name, transaction hash, or block number\'>' },

		# some explorers don't have the footer link
		{ :name => "GitHub footer link", :version => /Version: <a href="https:\/\/github.com\/[^\/]+\/blockscout\/.*" class="footer-link" target="_blank">([^<]+)</ },

		# aggressive test for /admin
		{ :url => "/admin", :status => 200, :text => '<h2 class="card-title text-center" data-test="administrator_login">Administrator Login</h2>' }
	]

end
