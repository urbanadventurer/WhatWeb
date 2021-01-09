##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
	name "Dell-OpenManage-Switch-Administrator"
	authors [
		"Max Davitt", # v0.1 # 2021-01-09 # Created plugin
	]
	version "0.1"
	description "The Dell OpenManage Switch Administrator is a web interface for various Dell network switches (PowerConnect and N series switches?)."

	matches [
		# Rough heuristics
		{ :name => "server", :certainty => 25, :search => "headers[server]", :text => "Web Server" },
		{ :name => "title", :certainty => 75, :text => "<title>Dell OpenManage Switch Administrator</title>" },
		{ :name => "redirect", :certainty => 75, :text => "window.top.location.href = \"dell_login.html\";" },

		# PowerConnect?
		{ :name => "model", :url => "/branding.html", :model => /<B>\s+([\w\d\-_ ]+)\s+<\// },
		{ :name => "model", :url => "/base/branding.html", :model => /<B>\s+([\w\d\-_ ]+)\s+<\// },

		# N series switches?
		{ :name => "alias", :url => "/dell_login.html", :string => /"login_text">\s+Login: [\d\.]+&nbsp;([\w\d\-_ ]+)\s+<\// },
		{ :name => "model", :url => "/dell_login.html", :model => /"login_server_default">([\w\d\-_ ]+)<\// }
	]

end
