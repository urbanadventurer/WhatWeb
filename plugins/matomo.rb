##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
	name "Matomo"
	authors [
		"Andrew Horton", # v0.1 # 2019-01-01 # Created plugin
	]
	version "0.1"
	description "Matomo is the leading open alternative to Google Analytics that gives you full control over your data. Matomo lets you easily collect data from websites, apps & the IoT and visualise this data and extract insights. Privacy is built-in. Matomo was formerly known as Piwik, and is developed in PHP."
	website "https://matomo.org"

	# Dorks # 
	dorks [
	'intitle:"sign in - Matomo"'
	]

	# Should this be split into two plugins fro Matomo tracking, and the Matomo web app?

	# Matches #
	matches [

		# Detect a page that's tracked
		{ :name => "enableLinkTracking", :text => "_paq.push(['enableLinkTracking'])"},

		# Detect the admin interface
		{ :name => "Title", :text => "<title>Sign in - Matomo</title>" },

		# Detect CHANGELOG.md
		{ :name => "CHANGELOG.md", :url => "/CHANGELOG.md", :status => 200, :text => "# Matomo Platform Changelog" },

		# Detect X-Matomo-Request-Id Header
		{ :name => "X-Matomo-Request-Id Header", :text => "", :search => "headers[X-Matomo-Request-Id]" },

		# Detect Cookie
		{ :name => "MATOMO_SESSID Cookie", :text => "MATOMO_SESSID", :search => "headers[Set-Cookie]" }
	] 


	aggressive do
	  # make a matches array
	  m = []

      target = URI.join(@base_uri.to_s,"/CHANGELOG.md").to_s
      status,url,ip,body,headers = open_target(target)

      versions = body.scan(/## Matomo ([\.0-9]+)/)

      if versions
		m << { :name => "Version from CHANGELOG.md", :version => versions.first }
	  end
	end

end
