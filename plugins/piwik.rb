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
description "Piwik is a downloadable, open source (GPL licensed) real time web analytics software program. - homepage: http://piwik.org/"

# Google results as at 2010-06-06 #
# 250,000 for +intitle:Piwik "JavaScript must be enabled in order for you to use Piwik in standard view"

# Examples #
examples %w|
piwik.org/demo/
web.grc.nasa.gov/piwik/
stats.mobileadsolution.com/owa/
secure.moatampa.com/moaadmin/stats/
missnancyscandystore.com/piwik/
www.ecovelo17.com/piwik/
61.135.112.26:6667/piwik/
analytics.idim.com
customers.corecodec.com/stats/
wncoc.org/stats/
mckerracher.net/piwik/
www.tchpc.tcd.ie/piwik/
aindice.com/piwik/
iphonethemegallery.com/piwik/
tascrafts.com/mystats/
sprousebrosfans.net/status/index.php
bittelbrunner.org/piwik/
araponics.com/piwik/
|

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
	m << { :name=>"PIWIK_SESSID Cookie" } if @meta["set-cookie"] =~ /PIWIK_SESSID/
        
	# Return passive matches
	m
end

end

