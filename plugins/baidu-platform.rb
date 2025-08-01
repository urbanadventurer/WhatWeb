##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Baidu-Platform"
authors [
  "Andrew Horton", # v0.1 # 2025-08-02 # Initial version
]
version "0.1"
description "Baidu's infrastructure identified by specific HTTP headers and HTML elements."
website "https://www.baidu.com/"

matches [
  # Server header
  { :search=>"headers[server]", :regexp=>/^BFE/, :name=>"Baidu Front End Server" },
  
  # Baidu-specific headers
  { :search=>"headers[x-bfe-transaction-id]", :name=>"Baidu Transaction ID" },
  { :search=>"headers[bfe_logid]", :name=>"Baidu Log ID" },
  { :search=>"headers[x-powered-by]", :regexp=>/^BD/i, :name=>"Baidu-powered" },
  
  # Baidu static resource
  { :regexp=>/<link rel="dns-prefetch" href="\/\/s[0-9]\.bdstatic\.com">/i, :name=>"Baidu Static Resource" }
]

end
