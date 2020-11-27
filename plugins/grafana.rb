##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
	name "Grafana"
	authors [
		"Andrew Horton", # v0.1 # 2020-10-06 # Created plugin
	]
	version "0.1"
	description "Grafana is a multi-platform open source analytics and interactive visualization web application. It provides charts, graphs, and alerts for the web when connected to supported data sources. It is expandable through a plug-in system. End users can create complex monitoring dashboards using interactive query builders. It is written in Go."
	website "https://github.com/grafana/grafana"

	# Default Port 3000

	dorks [
		'intitle:Grafana "Welcome to Grafana"'
	]

	# note: the version is disclosed in a javascript file in earlier versions.
	# app/app.ae1e5ed0.js - v1.8.1 - 2014-09-30
	# app/app.9c301bac.js - v1.9.0 - 2014-12-02

	# Matches #
	matches [

		{ :name => "title", :status => 200, :text => "<title>Grafana</title>" },

		{ :name => "window.grafanaBootData version", :version => /window.grafanaBootData = {.*"version":"([^\"]+)"/m }

	] 

end
