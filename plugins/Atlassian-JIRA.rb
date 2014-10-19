##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Atlassian-JIRA" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-11
version "0.1"
description "JIRA provides issue tracking and project tracking for software development teams to improve code quality and the speed of development."
website "http://www.atlassian.com/software/jira/"

# Google results as at 2011-07-11 #
# 494 for "Bug tracking and project tracking for software development powered by Atlassian JIRA" "Warning: either you have javascript disabled or your browser does not support javascript"

# ShodanHQ results as at 2011-07-11 #
# 1,977 for x-arequestid
#   759 for x-ausername
#    76 for atlassian.xsrf.token

# Dorks #
dorks [
'"Bug tracking and project tracking for software development powered by Atlassian JIRA" "Warning: either you have javascript disabled or your browser does not support javascript"'
]



# Matches #
matches [

# noscript
{ :text=>"<noscript><h1>Warning: either you have javascript disabled or your browser does not support javascript. To work properly, this page requires javascript to be enabled.</h1></noscript>" },

# Powered by link
{ :text=>'<a class="seo-link" href="http://www.atlassian.com/software/jira/bug-tracking.jsp">Bug tracking</a> and <a class="seo-link" href="http://www.atlassian.com/software/jira/tour/project-tracking.jsp">project tracking</a> for <a class="seo-link" href="http://www.atlassian.com/software/jira/tour/software-development.jsp">software development</a> powered by <a href="http://www.atlassian.com/software/jira" class="smalltext">Atlassian JIRA</a>' },

# Version Detection # Footer
{ :version=>/<span id="footer-build-information"  style="color: #666666;" >\(([^\)^\s]+)\)<\/span>/ },

# Meta Decorator
{ :text=>'<meta name="decorator" content="atl.general">' },

]

# Passive #
def passive
	m=[]

	# x-arequestid
	m << { :name=>"x-arequestid header" } if @headers["x-arequestid"] =~ /^[\d]+x[\d]+x[\d]+$/

	# x-ausername
	m << { :name=>"x-ausername header" } unless @headers["x-ausername"].nil?

	# atlassian.xsrf.token cookie
	m << { :name=>"atlassian.xsrf.token" } if @headers["set-cookie"] =~ /atlassian\.xsrf\.token=/

	# Return passive matches
	m
end
end

