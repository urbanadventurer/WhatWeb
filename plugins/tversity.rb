##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "TVersity"
authors [
  "Andrew Horton",
  # Andrew Horton, # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "The TVersity Media Server lets you manage your Internet and home media"
website "tversity.com"


matches [
	{ :md5=>"300b5c3f134d7ec0bca862cf113149d8", :url=>"/favicon.ico" },

	# HTTP Server 
	{ :version=>/TVersity Media Server/, :search=>"headers[server]" },

	# HTTP Server # Version Detection
	{ :version=>/TVersity Media Server\/([\d\.]+)/, :search=>"headers[server]" },

]

end

