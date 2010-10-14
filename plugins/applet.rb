##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Applet" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.1"
description "This plugin detects instances of applet HTML elements and grabs the URL. - homepage: http://en.wikipedia.org/wiki/Java_applet"

# 183 results for "this site requires java" @ 2010-10-15
examples %w|
www.co.ozaukee.wi.us/sheriff/
www.htmlcodetutorial.com/applets/applets.html
www.htmlcodetutorial.com/applets/_APPLET.html
www.whitehavenchargers.com
|

# URL Extraction
def passive
	m=[]

	if @body =~ /<[\s]*applet[^code]+code[\s]*=[\s]*[\"|\']?([^>^\"]+)/i
		version=@body.scan(/<[\s]*applet[^code]+code[\s]*=[\s]*[\"|\']?([^>^\"]+)/i)
		m << { :version=>version }
	end

	m

end

end

