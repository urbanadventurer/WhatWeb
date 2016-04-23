##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AOLserver" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "AOLserver is America Online's Open-Source web server. AOLserver is the backbone of the largest and busiest production environments in the world. AOLserver is a multithreaded, Tcl-enabled web server used for large scale, dynamic web sites."
website "http://www.aolserver.com/"
# Source: http://aolserver.github.com/

# ShodanHQ results as at 2011-06-04 #
# 34,038 for aolserver



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^AOLserver$/ },

# Version Detection
{ :search=>"headers[server]", :version=>/^AOLserver\/([^\s]+)/ },

]

end

