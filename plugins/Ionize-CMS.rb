##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ionize-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-16
version "0.1"
description "Ionize is a powerful & friendly Content Management System"
website "http://www.ionizecms.com/"

# Google results as at 2011-05-16 #
# 7 for "view : default/article" inurl:404
# 3 for "Ionize CMS - MIT licence" "User Name" "Password"
# 3 for "Ionize CMS" "MIT licence" inurl:admin

# ShodanHQ results as at 2011-05-16 #
# 8 for ionize_session

# Dorks #
dorks [
'"view : default/article" inurl:404'
]



# Matches #
matches [

# Login Page # Version Detection # div version
{ :version=>/<div id="version">([\d\.]+) - Ionize CMS - MIT licence<\/div>/ },

# Login Page # div loginWindow with class " clearfix"
{ :text=>'<div id="loginWindow" class=" clearfix">' },

# Login Page # div content
{ :text=>'<div id="content" class="content" onKeyPress="javascript:doSubmit(event);">' },

# 404 Page # p class "note"
{ :status=>404, :text=>'<p class="note">view : <b>default/article</b></p>' },

# 404 Page # p class "article-date" defaults to 07.09.2010
{ :status=>404, :text=>'<p class="article-date">07.09.2010</p>' },

# English # HandMade Theme # Meta Description
{ :text=>'<meta name="description" content="HandMade, an Ionize theme" />' },

# HTML Comment
{ :regexp=>/<!--[\s]+Displays the Google code defined in Ionize's Advanced settings panel[\s]+-->/ },

]

# Passive #
def passive
	m=[]

	# ionize_session Cookie
	m << { :name=>"ionize_session Cookie" } if @headers["set-cookie"] =~ /ionize_session=/

	# Return passive matches
	m
end

end

