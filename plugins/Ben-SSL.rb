##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Replaced passive function with match
##
Plugin.define "Ben-SSL" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-08
version "0.2"
description "Apache-SSL was developed by Ben Laurie and is often referred to as Ben-SSL"
website "http://apache-ssl.org/"

# ShodanHQ results as at 2011-02-08 #
# 34777 for Ben-SSL

matches [
 { :version=>/Ben-SSL\/([\d\.]+)/, :search=>"headers[server]" }
]


end

