##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ClientExec" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-23
version "0.1"
description "ClientExec is a comprehensive and flexible web hosting billing solution designed for customer billing, helpdesk, e-mail and (team) management and communication. ClientExec was conceived and built with small to mid-sized hosting companies in mind."
website "http://www.clientexec.com/"

# ShodanHQ results as at 2011-05-23 #
# 74 for CLIENTEXEC
# 33 for fuse=newedge

# Google results as at 2011-05-23 #
# 254 for intitle:"Support Center - Powered By ClientExec"

# Dorks #
dorks [
'intitle:"Support Center - Powered By ClientExec"'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- These should not have debug at the end for production -->' },

# Default Title
{ :text=>'<title>Support Center - Powered By ClientExec</title>' },

# Login Form HTML
{ :text=>'<form action="index.php?fuse=admin&amp;action=Login&amp;public=1" method="post"' },

# Theme Detection
{ :module=>/<img class="logo" src="templates\/([^\/]+)\/images\/public\/caption_photo\.jpg" alt="clientexec" \/>/ },

]

# Passive #
def passive
	m=[]

	# CLIENTEXEC Cookie
	if @headers["set-cookie"] =~ /CLIENTEXEC=[a-z\d]{26,32}; path=\//

		m << { :name=>"CLIENTEXEC Cookie" }

		# Unauthorized Version Installed
		if @body =~ /^Cannot access EnterLicense view directly$/
			m << { :string=>"Unauthorized Version" }
		end

	end

	# Return passive matches
	m
end

end

