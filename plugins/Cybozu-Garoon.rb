##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Cybozu-Garoon" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.2"
description "Cybozu Garoon is a web-based groupware suite integrating key collaboration applications that provide a ready-to-run intranet solution."
website "http://cybozu.com/en/grn/product/"

# ShodanHQ results as at 2011-05-31 #
# 251 for Cybozu-WS
# Most results are from Japan

matches [
	# Version Detection # HTTP Server Header
	{ :search=>"headers[server]", :version=>/^Cybozu-WS\/([^\s]+)$/ },

]

end

