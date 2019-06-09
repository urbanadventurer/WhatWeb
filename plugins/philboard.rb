##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "PhilBoard"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-27
  # v0.2 # Updated version detection and ghdb match. 
]
version "0.2"
description "PhilBoard - ASP powered forum"
website "http://www.philboards.com/"

# 47 results for "powered by philboard" -Vulnerabilities -Vulnerability @ 2010-06-27


matches [

# GHDB Match
{ :ghdb=>'"powered by philboard" inurl:philboard.asp', :certainty=>75 },

# Version detection # Default logo HTML
{ :version=>/<img src="images\/philboard_small.gif" alt="powered by philboard [v]*([\d\.]+)" width="76" height="21" border="0" align="middle">/ },

]

end

