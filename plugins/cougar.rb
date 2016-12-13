##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Cougar" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.2"
description "Cougar video conferencing server"
website "http://www.cougarconference.com/"

# ShodanHQ results as at 2011-07-27 #
# 21,987 for Cougar
# 21,026 for Cougar Supported

matches [

	{ :search=>"headers[server]", :version=>/^Cougar\/([\d\.]+)$/ }

]

end

