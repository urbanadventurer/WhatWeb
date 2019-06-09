##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "DotCMS"
authors [
  "Andrew Horton",
  # v0.2 # removed :name and :certainty=>100. 
  "Bhavin Senjaliya", # v0.3 # 2016-08-19 # Added cookie. 
]
version "0.3"
description "DotCMS is an opensource CMS written in Java. Has enterprise support"
website "http://www.dotcms.org/"



# <img src="/resize_image?path=/dotAsset/
# <img src="/dotAsset/
# <link href="/dotAsset/


matches [
	{:regexp=>/<img[^>]+src="[^"]*\/dotAsset\//}, 
	{:regexp=>/<link[^>]+href="[^"]*\/dotAsset\//}, 
	{:regexp=>/<a[^>]+href="[^h][^"]*index\.dot/}, 

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /dotcms/, :name=>"dotcms cookie" },

]

end


