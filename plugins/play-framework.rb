##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Play-Framework" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-21
version "0.1"
description "Play is an open source web application framework, written in Java, which follows the model-view-controller architectural pattern. Build and deployment is all handled by Python scripts."
website "http://www.playframework.org/"

# ShodanHQ results as at 2011-09-21 #
# 148 for Play Framework



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Play! Framework;(\d[^\s^;]+;[^\s]+)$/ },

]

end

