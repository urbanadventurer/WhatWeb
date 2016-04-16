##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-03-19 #
# Updated version detection
# Added HTTP header matches
##
# Version 0.2 #
# Updated version detection
##
Plugin.define "Confluence" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-06
version "0.3"
description "Confluence combines powerful online authoring capabilities, deep Office integration and an extensive plugin catalog to help people work better together and share information effortlessly."
website "http://www.atlassian.com/software/confluence/"

# ShodanHQ results as at 2011-03-19 #
# 13 for x-confluence

# Google results as at 2011-03-19 #
# 144 for "Atlassian Confluence" +"the Enterprise Wiki" +"Intranet software for documentation and knowledge management" +"Report a bug"



# Matches #
matches [

# GHDB Match
{ :certainty=>75, :ghdb=>'"Atlassian Confluence" "the Enterprise Wiki" "Intranet software for documentation and knowledge management" "Report a bug"' },

# Meta confluence-context-path
{ :text=>'<meta id="confluence-context-path" name="confluence-context-path" content="">' },

# Powered by text
{ :text=>'<li class="noprint"><a href="http://www.atlassian.com/software/confluence" class="hover-footer-link">Atlassian Confluence</a>' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www\.atlassian\.com\/software\/confluence"[^>]*>Atlassian Confluence<\/a> ([\d\._]+)/ },

]

# Passive #
def passive
	m=[]

	# x-confluence-cluster-node
	m << { :name=>"x-confluence-cluster-node header" } unless @headers["x-confluence-cluster-node"].nil?

	# x-confluence-request-time
	m << { :name=>"x-confluence-request-time header" } unless @headers["x-confluence-request-time"].nil?

	# Return passive matches
	m
end

end

