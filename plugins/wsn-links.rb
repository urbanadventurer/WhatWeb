##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-17 # Andrew Horton
# Added website parameter
##
Plugin.define "WSN-Links" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.2"
description "WSN Links is a links directory with google pageranks, link checking, reciprocal linking facilities and much more. Multilingual and highly extensible, it offers more than you could imagine in a links directory."
website "http://www.wsnlinks.com/"

# Google results as at 2011-03-16 #
# 12 results for "WSN Links is unable to render this page. The reason is described below: " intitle:"WSN Links"
# 14 results for intitle:"WSN Links" ext:php "Non-numeric id value given in creating object"



# Matches #
matches [

# Admin Page # Title # adminlogin.php
{ :text=>'<title>WSN Links Administration Panel</title>' },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="group" style="margin-left: 8px;">WSN Links ([\d\.]+) Admin Login<\/span>/ },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="group">WSN Links ([\d\.]+) Admin Panel<\/span>/ },

# HTML Comment # Shared with other WSN Software products
{ :certainty=>25, :text=>'<!-- place any jquery-dependent script tags that need to be before the /head tag in here -->' },

# boxtitle # Shared with other WSN Software products
{ :certainty=>25, :regexp=>/<div class="boxtitle" on[c|C]lick="minmax\('[a-z]+box'\)"><img src=/ },

# License Agreement # setup.php
{ :text=>'<textarea readonly rows="20" cols="75">WSN Links License Agreement' },

]

# Passive #
def passive
	m=[]

	# Version Detection
	if @body =~ /<title>WSN Links<\/title>/

		# Error Page
		if @body =~ /<p>WSN Links is unable to render this page. The reason is described below:<\/p>/ and @body =~ /<p>Version info: WSN Links ([\d\.]+)<\/p>/
			m << { :version=>@body.scan(/<p>Version info: WSN Links ([\d\.]+)<\/p>/) }
		end

		# Error Page # no id parameter
		if @body =~ /<div class="main">Non-numeric id value given in creating object.<\/div>/ and @body =~ /<p>WSN Links ([\d\.]+)<\/p>/
			m << { :version=>@body.scan(/<p>WSN Links ([\d\.]+)<\/p>/) }
		end

	end

	# Return passive matches
	m
end

end

