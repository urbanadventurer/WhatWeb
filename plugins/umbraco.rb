##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated matches and version detection
##
Plugin.define "Umbraco" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-12
version "0.2"
description "umbraco is an open source project with roots back to year 2000 even though it wasn't released as open source until 2004."
website "http://www.umbraco.org"

# About 24,400 results for "powered by umbraco" @ 2010-06-08
# 27 results for "site powered by umbraco" @ 2010-06-08
# 17 results for "site powered by umbraco v4" @ 2010-06-08

# Dorks #
dorks [
'"site powered by umbraco"'
]



matches [

# GHDB Match
{ :ghdb=>'"powered by umbraco"', :certainty=>25 },

# Meta generator
{ :text=>'<meta name="generator" content="umbraco" />' },

# Powered by text
{ :regexp=>/Powered by[^<]*<a[\s]+href="http:\/\/[www.]*umbraco.org[^>]*>Umbraco<\/a>/i },

# Version detection # Powered by text
{ :version=>/powered by[^<]*<a[\s]+href="http:\/\/[www.]*umbraco.org[^>]*>umbraco v([^<]+)<\/a>/i },

# Version detection # Powered by text # 4.x
{ :regexp=>/powered by[^<]*<a[\s]+href="http:\/\/[www.]*umbraco.org[^>]*>umbraco v4<\/a>/i, :version=>"4.x" },

# Version detection # Meta generator
{ :version=>/<meta name="generator"[^>]*content="umbraco[\s]+([0-9\.]+)"/i },

]

end

