##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Amazon-CloudFront"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-11-02
  "Andrew Horton", # v0.2 # 2025-08-02 # Updated name, description, website and added CloudFront-specific header detection
]
version "0.2"
description "Amazon CloudFront is a content delivery network (CDN) that delivers static and dynamic web content, including live and on-demand video."
website "https://aws.amazon.com/cloudfront/"

# ShodanHQ results as at 2010-11-02 #
# 3,530 for X-Cache: Error from cloudfront
# 3,532 for server cloudfront



matches [

# Error page
{ :status=>403, :text=>"<html><body>Sorry, invalid request</body></html>" },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^CloudFront/ },

# HTTP X-Cache Header
{ :search=>"headers[x-cache]", :regexp=>/^Error from cloudfront/ },

# Additional CloudFront-specific headers
{ :search=>"headers[x-amz-cf-pop]", :name=>"CloudFront POP Location" },
{ :search=>"headers[x-amz-cf-id]", :name=>"CloudFront Request ID" },

]

end

