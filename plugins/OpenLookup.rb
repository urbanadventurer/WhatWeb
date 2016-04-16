##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenLookup" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-12
version "0.1"
description "OpenLookup is a public, administratively decentralized key-value datastore. It offers an XML-RPC interface compatible with OpenDHT, but it is not a DHT. Instead, it fully replicates the datastore among service providers."
website "http://openlookup.googlecode.com/"

# Google results as at 2011-06-12 #
# 10 for "OpenLookup Node Status" intitle:Openlookup "To query a node via round-robin DNS"

# Dorks #
dorks [
'"OpenLookup Node Status" intitle:Openlookup "To query a node via round-robin DNS"'
]



# Matches #
matches [

# h2 Headinge
{ :text=>'<h2>OpenLookup Node Status</h2>' },

# Version Detection
{ :version=>/<p><a href="http:\/\/openlookup\.googlecode\.com\/">Source code and\n	further information<\/a> are available\.  This is OpenLookup V([^<]+)\.<\/p>/ },

]

end

