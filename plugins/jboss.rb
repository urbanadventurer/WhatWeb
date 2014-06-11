##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-08-02 # Brendan Coles <bcoles@gmail.com>
# Added example urls and X-Powered-By version+JBossWeb detection
##
Plugin.define "JBoss" do
author "Louis Nyffenegger"
version "0.2"
description "JBoss Application Server is the #1 most widely used Java application server on the market. A Java EE certified platform for developing and deploying enterprise Java applications, Web applications, and Portals, JBoss Application Server provides the full range of Java EE 5 features as well as extended enterprise services including clustering, caching, and persistence. - Homepaeg: http://www.jboss.org/jbossas/"

# ShodanHQ results as at 2011-08-02 #
# 26,691 for JBoss
# 10,169 for JBossWeb
#     68 for JBossAS

# Google results as at 2011-08-02 #
# 41 for intitle:"Welcome to JBoss AS"

# Dorks #
dorks [
'intitle:"Welcome to JBoss AS"'
]



# Matches #
matches [

	# Default title from Jboss homepage
	{	:name=>"Jboss default title",
		:regexp=>/<title>Welcome to JBoss AS<\/title>/},
	
	# Jboss Homepage contains a link to administration console
	{	:name =>"link to Administration Console",
		:certainty=>50,
		:regexp=>/<a href=\"\/admin-console\/\">Administration Console<\/a>/},

	# Jboss Homepage contains a link to web console
	{	:name =>"link to Web Console",
		:regexp=>/<a href=\"\/web-console\/\">Jboss Web Console<\/a>/},

	# Jboss Homepage contains a link to  JMX console
	{	:name =>"link to JMX Console",
		:regexp=>/<a href=\"\/jmx-console\/\">JMX Console<\/a>/}	
]

# Passive #
def passive
	m=[]

	# Version Detection # X-Powered-By Header
	if @headers["x-powered-by"] =~ /JBoss(AS)?-([^\/^\s]+)/
		m << { :version=>"#{$2}" }
	end

	# Module Detection # JBossWeb
	if @headers["x-powered-by"] =~ /(JBossWeb-[^\/^\s^,]+)/
		m << { :module=>"#{$1}" }
	end

	# Return passive matches
	m
end
end

