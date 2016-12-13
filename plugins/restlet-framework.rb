##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Restlet-Framework" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-21
version "0.1"
description "Restlet is a lightweight, comprehensive, open source REST framework for the Java platform."
website "http://www.restlet.org/"

# ShodanHQ results as at 2011-09-21 #
# 36 for Restlet-Framework



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Restlet-Framework\/([^\s]+)$/ },

]

end

