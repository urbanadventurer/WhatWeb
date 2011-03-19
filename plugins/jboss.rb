##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Jboss" do
	author "Louis Nyffenegger"
	version "0.1"
	description "JBoss Application Server is the #1 most widely used Java application server on the market. A Java EE certified platform for developing and deploying enterprise Java applications, Web applications, and Portals, JBoss Application Server provides the full range of Java EE 5 features as well as extended enterprise services including clustering, caching, and persistence. - Homepaeg: http://www.jboss.org/jbossas/"

	# Matches #
	matches [
		# 
		# Default title from Jboss homepage
		{	:name=>"Jboss default title",
			:certainty=>100,
			:regexp=>/<title>Welcome to JBoss AS<\/title>/},
		
		# Jboss Homepage contains a link to administration console
		{	:name =>"link to Administration Console",
			:certainty=>50,
			:regexp=>/<a href=\"\/admin-console\/\">Administration Console<\/a>/},


		# Jboss Homepage contains a link to web console
		{	:name =>"link to Web Console",
			:certainty=>100,
			:regexp=>/<a href=\"\/web-console\/\">Jboss Web Console<\/a>/},
	
		# Jboss Homepage contains a link to  JMX console
		{	:name =>"link to JMX Console",
			:certainty=>100,
			:regexp=>/<a href=\"\/jmx-console\/\">JMX Console<\/a>/}	
	]

end

