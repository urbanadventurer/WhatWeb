##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GitHub-Profile" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-16
version "0.1"
description "This plugin extracts a person's name, username, e-mail address and homepage from their GitHub profile - homepage: http://github.com/"

# Google results as at 2011-01-16 #
# 23,500 for "You're not logged in!" intitle:Profile site:github.com

# Examples #
examples %w|
https://github.com/urbanadventurer
https://github.com/bcoles
https://github.com/matti
https://github.com/nikosk
https://github.com/cdybedahl
https://github.com/yehgdotnet
https://github.com/pawal
|

# Matches #
matches [

	# Homepage :
	{ :filepath=>/<dd class="url"><a rel="nofollow me" [^<]* class="url">([^<]*)<\/a><\/dd>/ },

	# Full Name :
	{ :version=>/<dd class="fn">([^<]*)<\/dd>/ },

	# Username :
	{ :account=>/GitHub.profileName = GitHub.profileName \|\| '([^\']*)';/ },

]

# Passive #
def passive
	m=[]

	# Extract e-mail address
	if @body =~ /<dd class="email"><script type="text\/javascript">eval\(decodeURIComponent\('([^\']*)'/
		email=CGI.unescape(@body.scan(/<dd class="email"><script type="text\/javascript">eval\(decodeURIComponent\('([^\']*)'/).to_s)
		m << { :string=>email.scan(/mailto:([^\\]*)\\"/).to_s } if email =~ /mailto:([^\\]*)\\"/
	end

	m

end

end


