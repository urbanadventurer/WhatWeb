##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "uTorrent"
authors [
  "Andrew Horton",
]
version "0.1"
description "The uTorrent GUI is a web interface to the uTorrent BitTorrent client"
website "https://web.utorrent.com/"



# Passive #
passive do
	m=[]
	m<< {:name=>"Page body is 'invalid request'" } if @body == "invalid request"
	m<< {:name=>'Basic realm="uTorrent"' } if @headers['www-authenticate'] == 'Basic realm="uTorrent"'
	m
end
end

