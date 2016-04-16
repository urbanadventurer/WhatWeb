##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenLabyrinth" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-03
version "0.1"
description "OpenLabyrinth is a web application for authoring and delivering virtual patient and other decision path and maze-like activities. It is written in ASP/VBScript and requires an ODBC SQL database."
website "http://sourceforge.net/projects/openlabyrinth/"

# Google results as at 2011-08-03 #
# 12 for inurl:mstartnode.asp?mapid=

# Dorks #
dorks [
'inurl:mstartnode.asp?mapid='
]



# Matches #
matches [

# Logo HTML
{ :text=>'/images/openlabyrinth-logo.jpg" alt="Labyrinth Identity" border="0" width="150" height="150"></a>' },

]


# Passive #
def passive
	m=[]

	# Form
	if @body =~ /^<form method="post" action="logpass\.asp">$/

		m << { :certainty=>25, :name=>"Form Tag" }

		# Version Detection
		if @body =~ /<h5><font color="#000000">v([^\s^<]+)</
			m << { :version=>"#{$1}" }
		end
	end

	# Return passive matches
	m
end
end

