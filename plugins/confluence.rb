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
description "Confluence combines powerful online authoring capabilities, deep Office integration and an extensive plugin catalog to help people work better together and share information effortlessly. - homepage: http://www.atlassian.com/software/confluence/"

# ShodanHQ results as at 2011-03-19 #
# 13 for x-confluence

# Google results as at 2011-03-19 #
# 144 for "Atlassian Confluence" +"the Enterprise Wiki" +"Intranet software for documentation and knowledge management" +"Report a bug"

# Examples #
examples %w|
74.122.104.69
192.9.162.69
84.255.243.84
72.242.107.245
159.14.198.91
66.165.176.42
sandbox.onconfluence.com
artemistech.com
wiki.objectstyle.org
www.securecoding.cert.org
support.hyperic.com
docs.codehaus.org
opticks.org
wiki.list.org
www.artemissoftware.biz
docs.rice.edu
confluence.pegasus.isi.edu
www.oscommerce.info
www.bobsgear.com
confluence.slac.stanford.edu
fosswiki.liip.ch
wiki.flux-cms.org
wiki.csinitiative.com
wiki.fourkitchens.com
k15t.com/confluence/
mygrid.org.uk/dev/wiki/
support.process-one.net/doc/display/
www.mongodb.org/display/
confluence.pegasus.isi.edu/display/
|

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
	m << { :name=>"x-confluence-cluster-node header" } unless @meta["x-confluence-cluster-node"].nil?

	# x-confluence-request-time
	m << { :name=>"x-confluence-request-time header" } unless @meta["x-confluence-request-time"].nil?

	# Return passive matches
	m
end

end

