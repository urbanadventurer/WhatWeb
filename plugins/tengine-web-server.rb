##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Tengine-Web-Server"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2012-05-17
  "Andrew Horton", # v0.2 # 2025-08-02 # Added Alibaba-specific Tengine header detection
]
version "0.2"
description "Tengine is a web server originated by Taobao, the largest e-commerce website in Asia. It is based on the popular Nginx HTTP server."
website "http://tengine.taobao.org/"

# ShodanHQ results as at 2012-05-17 #
# 355 for Tengine



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Tengine$/ },

# HTTP Server Header # Version Detection
{ :search=>"headers[server]", :version=>/^Tengine\/([^\s]+)/ },

# Alibaba-specific headers often found with Tengine
{ :search=>"headers[eagleid]", :name=>"Alibaba EagleId Header" },
{ :search=>"headers[eagleeye-traceid]", :name=>"Alibaba EagleEye Trace ID" },
{ :search=>"headers[timing-allow-origin]", :name=>"Tengine Timing Allow Origin" },

]

end

