##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tumblr" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-30
version "0.1"
description "A feature rich and free blog hosting platform offering professional and fully customizable templates, bookmarklets, photos, mobile apps, and social network"
website "http://www.tumblr.com/"

# Google results as at 2011-07-30 #
# 658 for "Powered by Tumblr"

# Dorks #
dorks [
'"Powered by Tumblr"'
]



# Matches #
matches [

# shortcut icon
{ :regexp=>/<link rel="(shortcut )?icon" href="http:\/\/[\d]{1,2}\.media\.tumblr\.com\/avatar_[a-f\d]{12}_16\.gif"[\s]?\/>/ },

# meta name="tumblr-theme"
{ :regexp=>/<meta name="tumblr-theme" content="[\d]+"[\s]?\/>/ },

# HTML Comment + iframe
{ :text=>'<!-- BEGIN TUMBLR CODE --><iframe src="http://assets.tumblr.com/iframe.html' },

]

# Passive #
def passive
	m=[]

	# Username Detection # x-tumblr-user Header
	m << { :account=>@headers["x-tumblr-user"] } unless @headers["x-tumblr-user"].nil?

	# Return passive matches
	m
end
end

