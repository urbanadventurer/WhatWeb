##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CloudFront" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-02
version "0.1"
description "CloudFront Server"

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

]

end

