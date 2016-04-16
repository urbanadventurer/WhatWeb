##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Lotus-Domino" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-22
version "0.1"
description "Lotus Domino - Social business application platform"
website "https://www-01.ibm.com/software/lotus/products/domino/"

# Google results as at 2012-07-22 #
# 833 for ext:nsf site:edu
# 780 for ext:nsf site:gov
#  81 for ext:nsf site:mil

# ShodanHQ results as at 2012-07-22 #
# 68,292 for Lotus-Domino



# Matches #
matches [

# Extension # .nsf
{ :certainty=>25, :ghdb=>'filetype:nsf' },

# HTTP Server Header
{ :search=>"headers[server]", :version=>/^Lotus-Domino\/([^\s]+)/ },
{ :search=>"headers[server]", :regexp=>/^Lotus-Domino$/ },

# /favicon.ico
{ :certainty=>75, :url=>"/favicon.ico", :md5=>"639b61409215d770a99667b446c80ea1" },

]

end

