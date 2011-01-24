##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2010-10-22 # Brendan Coles <bcoles@gmail.com> #
# Added type, user id and app id extraction
##
Plugin.define "OpenGraphProtocol" do
author "Caleb Anderson"
version "0.2"
description "The Open Graph protocol enables you to integrate your Web pages into the social graph. It is currently designed for Web pages representing profiles of real-world things . things like movies, sports teams, celebrities, and restaurants. Including Open Graph tags on your Web page, makes your page equivalent to a Facebook Page."

examples %w|
developers.facebook.com
www.salon.com/news/opinion/glenn_greenwald/2010/07/23/intelligence/index.html
www.imdb.com
|

matches [

# Meta tag # Match og:title
{ :regexp=>/<meta[^>]*property="og:title"[^>]*>/i },

# Get type # og:type
{ :version=>/<meta[^>]*property="og:type"[^>]*content="([^\"^>]+)"/, :regexp_offset=>0 },

]

# Extract details
def passive
	m=[]

	# Get user IDs
	if @body =~ /<meta property="fb:admins" content="([^\"^>]+)"/
		accounts=@body.scan(/<meta property="fb:admins" content="([^\"^>]+)"/)
		m << { :account=>accounts }
	end

	# Get app IDs
	if @body =~ /<meta property="fb:app_id" content="([^\"^>]+)"/
		modules=@body.scan(/<meta property="fb:app_id" content="([^\"^>]+)"/)
		m << { :module=>modules }
	end

	m

end

end


