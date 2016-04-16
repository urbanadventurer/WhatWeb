##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Piwik" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-06
version "0.2"
description "Piwik is a downloadable, open source (GPL licensed) real time web analytics software program."
website "http://piwik.org/"

# Google results as at 2010-06-06 #
# 250,000 for +intitle:Piwik "JavaScript must be enabled in order for you to use Piwik in standard view"

# Dorks #
dorks [
'intitle:Piwik "JavaScript must be enabled in order for you to use Piwik in standard view"'
]



# Matches #
matches [

# GHDB Match
{ :certainty=>75, :ghdb=>'+intitle:Piwik "JavaScript must be enabled in order for you to use Piwik in standard view"' },

# Default title
{ :text=>'<title>Piwik &rsaquo; Web Analytics Reports</title>' },

# Default loading image
{ :text=>'<img src="themes/default/images/loading-blue.gif" alt="" /> Loading data' },

# Version Detection # Meta Generator
{ :version=>/<meta name=\"generator\"[^>]*content=\"Piwik ([0-9\.]+)/ },

]

# Passive #
def passive
        m=[]

	# PIWIK_SESSID Cookie
	m << { :name=>"PIWIK_SESSID Cookie" } if @headers["set-cookie"] =~ /PIWIK_SESSID/
        
	# Return passive matches
	m
end

end

