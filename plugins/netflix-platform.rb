##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Netflix-Platform"
authors [
  "Andrew Horton", # v0.1 # 2025-08-02 # Initial version
]
version "0.1"
description "Netflix platform infrastructure identified by specific HTTP headers."
website "https://netflix.com/"

matches [
  # Netflix-specific headers
  { :search=>"headers[x-netflix.nfstatus]", :name=>"Netflix Status Header" },
  { :search=>"headers[x-netflix.proxy.execution-time]", :name=>"Netflix Execution Time Header" },
  { :search=>"headers[x-netflix-cookieandmsl.profileguid.match]", :name=>"Netflix Profile Match Header" },
  
  # Meta tags
  { :regexp=>/<meta property="og:site_name"[^>]*content="Netflix"/i, :name=>"Netflix OG Meta Tag" }
]

end
