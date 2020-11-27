##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
	name "Wobserver"
	authors [
		"Andrew Horton", # v0.1 # 2020-09-14 # Created plugin
	]
	version "0.1"
	description "Wobserver is a web based metrics, monitoring, and observer drop-in system for web apps. It is written in Elixir (based on Erlang), and available as a plugin for Phoenix web applications."
	website "https://github.com/shinyscorpion/wobserver"

	# can disclose database passwors, keys used to sign cookies, etc

	# default port 4001
	# default webroot ["/", "/wobserver/"] (behind nginx reverse proxy)

	matches [

		{ :text => '<meta name="description" content="A web based version of the Erlang observer.">' },

		{ :text => '<title>Wobserver</title>' },

		{ :url => "/wobserver/api/system", :status=>200, :name=> 'system_architecture', :string => /system_architecture":"([^"]+)"/ },
		{ :url => "/wobserver/api/system", :status=>200, :name=> 'elixir_version', :string => /elixir_version":"([^"]+)"/ },
		{ :url => "/wobserver/api/system", :status=>200, :name=> 'erts_version', :string => /erts_version":"([^"]+)"/ },

	] 

end
