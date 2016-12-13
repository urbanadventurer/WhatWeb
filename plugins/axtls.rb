##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-18 # Andrew Horton
# Replaced passive function with :search=>"headers[server]" pattern
# Added website parameter
##
Plugin.define "axTLS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.2"
description "The axTLS embedded SSL project is a highly configurable client/server TLSv1 SSL library designed for platforms with small memory requirements. It comes with a small HTTP/HTTPS server and additional test tools."
website "http://axtls.sourceforge.net/"

# ShodanHQ results as at 2011-05-30 #
# 592 for axhttpd

matches [
	{ :version => /^axhttpd\/([^\s]+)$/, :search => "headers[server]" }
]

end
