##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IBM-WebSphere" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "IBM WebSphere - Homepage: https://www-01.ibm.com/software/websphere/"

# ShodanHQ results as at 2011-03-13 #
# 2,176 for WebSphere

# Examples #
examples %w|
60.30.108.221
210.28.216.232
111.75.206.14
216.105.250.20
218.31.157.93
209.5.145.203
80.249.189.88
150.183.158.184
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^WebSphere Application Server\/([^\s]+)$/ },

]

end

