##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Spiceworks" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-23
version "0.1"
description "Spiceworks' single, easy-to-use interface combines Network Inventory, Help Desk, Mapping, Reporting, Monitoring and Troubleshooting"
website "http://www.spiceworks.com/product/"

# ShodanHQ results as at 2011-05-23 #
# 2,101 for spiceworks_session
# 20 for -spiceworks_session spiceworks



# Matches #
matches [

# Meta Author
{ :text=>'<meta name="author" content="Spiceworks, Inc." />' },

# Login Page # compatible browsers message
{ :text=>'<p>Spiceworks is compatible with <a href="http://community.spiceworks.com/help/Spiceworks_Requirements#Browser">modern browsers</a>, and requires JavaScript, Cookies, and Stylesheets (CSS) to function correctly.</p>' },

# Login Page # Title
{ :text=>'<title>Spiceworks - Login Required</title>' },

]

# Passive #
def passive
	m=[]

	# spiceworks_session cookie
	# Session cookie format: URL encoded base64 string beginning with "BAh7"
	# Terminated by "--" then followed by a md5 hash
	m << { :name=>"spiceworks_session cookie" } if @headers["set-cookie"] =~ /spiceworks_session=BAh7[^\s]+--/

	# spiceworks cookie
	m << { :name=>"spiceworks cookie" } if @headers["set-cookie"] =~ /spiceworks=[a-f\d]{32}; path=\//

	# If a match was found
	unless m.empty?

		# Version Detection # Login Page # Logo HTML
		if @body =~ /<h1><img alt="Spiceworks" src="\/images\/logos\/large\.png\?([\d]{7})" \/><\/h1>/
			m << { :version=>@body.scan(/<h1><img alt="Spiceworks" src="\/images\/logos\/large\.png\?([\d]{7})" \/><\/h1>/)[0][0].insert(1, ".").insert(3, ".") } unless version.nil?
		end

		# Version Detection # General stylesheet
		if @body =~ /<link href="\/stylesheets\/general\.css\?([\d]{7}+)" media="screen" rel="stylesheet" type="text\/css" \/>/
			m << { :version=>@body.scan(/<link href="\/stylesheets\/general\.css\?([\d]{7})" media="screen" rel="stylesheet" type="text\/css" \/>/)[0][0].insert(1, ".").insert(3, ".") }
		end

	end

	# Return passive matches
	m
end

end

