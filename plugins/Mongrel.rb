##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mongrel" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-15
version "0.1"
description "Mongrel is an open-source HTTP library and web server written in Ruby. - Homepage: http://rubyforge.org/projects/mongrel/"

# ShodanHQ results as at 2011-03-13 #
# 5,815 for Mongrel

# Examples #
examples %w|
184.72.85.162
87.248.226.195
173.255.213.239
184.106.220.14
85.25.229.83
131.215.239.11
77.92.147.136
97.65.152.218
184.106.214.87
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Mongrel ([\d][^\s]+)/ },

]

end

