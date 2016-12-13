##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CERN" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "The CERN httpd (also known as W3C httpd) is a generic public domain full-featured hypertext server which can be used as a regular HTTP server. Version 3.0A is the final version. It was generated July 15th 1996."
website "http://www.w3.org/Daemon/"

# ShodanHQ results as at 2011-03-13 #
# 1,118 for CERN
#   969 for CERN/3.0
#    37 for CERN/3.0a



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^CERN\/([^\s]+)/ },

]

end

