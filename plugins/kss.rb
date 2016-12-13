##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "KSS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.1"
description "KSS (Kinetic Style Sheets) is an Ajax framework that allows UI development without writing any Javascript. It uses style sheets with CSS-compliant syntax to declare and bind dynamic behaviors in the browser. The engine supports a set of generic DOM-like commands; they are computed on the server and sent back to manipulate the HTML page."
website "http://kssproject.org/"

# More Info #

# The client-side Javascript library needs to be included in your page. It fetches Kinetic style sheets from the server, parses them and binds a set of action to browser events and/or page elements.

# Server-side code is currently available for Zope (2 and 3, which includes Plone). The kss.base egg (which is currently in alpha) brings server-side support to other pythonic platforms, such as pylons, django and grok. The Javascript client-side code can be used independently of existing server-side support.

# ShodanHQ results as at 2011-06-02 #
# 155 for X-Ksscommands



# Passive #
def passive
	m=[]

	# X-Ksscommands HTTP Header
	m << { :name=>"X-Ksscommands HTTP Header" } unless @headers["x-ksscommands"].nil?

	# Return passive matches
	m
end

end

