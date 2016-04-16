##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WSN-Gallery" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "WSN Gallery is a media gallery for images, videos and more. It can resize and edit images, and convert videos to play in the integrated flash player for a YouTube-style video site. Translatable to any language, it offers a vast array of features to power your gallery site."
website "http://www.wsngallery.com/"

# Google results as at 2011-03-16 #
# 2 for "WSN Gallery" "Non-numeric id value given in creating object"
# 1 for "WSN Gallery" inurl:"adminlogin.php"



# Matches #
matches [

# Admin Page # Title # adminlogin.php
{ :text=>'<title>WSN Gallery Admin Login</title>' },
{ :text=>'<title>WSN Gallery Administration Panel</title>' },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="(topbar|group)" style="margin-left: 8px;">WSN Gallery ([\d\.]+) Admin Login<\/span>/, :offset=>1 },

# Admin # Version Detection # adminlogin.php
{ :version=>/<span class="(topbar|group)">WSN Gallery ([\d\.]+) Admin Panel<\/span>/, :offset=>1 },

# HTML Comment # Shared with other WSN Software products
{ :certainty=>25, :text=>'<!-- place any jquery-dependent script tags that need to be before the /head tag in here -->' },

# boxtitle # Shared with other WSN Software products
{ :certainty=>25, :regexp=>/<div class="boxtitle" on[c|C]lick="minmax\('[a-z]+box'\)"><img src=/ },

# License Agreement # setup.php
{ :text=>'<textarea readonly rows="20" cols="75">WSN Gallery License Agreement' },

]

# Passive #
def passive
	m=[]

	# Version Detection
	if @body =~ /<title>WSN Gallery<\/title>/

		# Error Page
		if @body =~ /<p>WSN Gallery is unable to render this page. The reason is described below:/ and @body =~ /<p>Version info: WSN Gallery ([\d\.]+)<\/p>/
			m << { :version=>@body.scan(/<p>Version info: WSN Gallery ([\d\.]+)<\/p>/) }
		end

		# Error Page # no id parameter
		if @body =~ /<div class="main">Non-numeric id value given in creating object.<\/div>/ and @body =~ /<p>WSN Gallery ([\d\.]+)<\/p>/
			m << { :version=>@body.scan(/<p>WSN Gallery ([\d\.]+)<\/p>/) }
		end

	end

	# Return passive matches
	m
end

end

