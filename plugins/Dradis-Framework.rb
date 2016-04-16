##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dradis-Framework" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-17
version "0.1"
description "Dradis is an open source framework to enable effective information sharing, specially during security assessments. Dradis is a self-contained web application that provides a centralised repository of information to keep track of what has been done so far, and what is still ahead."
website "http://Dradisframework.org/"

# ShodanHQ results as at 2011-05-17 #
# 1 for _dradis_session

# Google results as at 2011-05-17 #
# 2 for intitle:"Welcome to dradis"
# 5 for intitle:"First Time User's Wizard - dradis" inurl:wizard

# Dorks #
dorks [
'intitle:"First Time User\'s Wizard - dradis" inurl:wizard'
]



# Matches #
matches [

# Footer link
{ :text=>'effective information sharing - <a href="http://dradisframework.org/">http://dradisframework.org</a>' },

# homepage link
{ :text=>'<div id="back"><a href="/">&lsaquo; back to the app.</a></div>' },

# wizard link
{ :text=>'<p id="wizard">Not familiar with Dradis? Checkout the <a href="/wizard">Wizard</a>.</p>' },

# Wizard Page # server plugins link
{ :text=>'<li>Integration with existing systems and tools through <a href="http://Dradisframework.org/server_plugins.html">server plugins</a>.</li>' },

# Version Detection # Wizard Page # Default Title
{ :version=>/<title>First Time User's Wizard - dradis v([\d\.]+)<\/title>/ },

]

# Passive #
def passive
	m=[]

	# _dradis_session cookie
	m << { :name=>"_dradis_session cookie" } if @headers["set-cookie"] =~ /^_dradis_session=/

	# Return passive matches
	m
end

end

