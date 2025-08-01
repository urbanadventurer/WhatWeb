##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Weibo-Platform"
authors [
  "Andrew Horton", # v0.1 # 2025-08-02 # Initial version
]
version "0.1"
description "Sina Weibo infrastructure and services identified by unique headers and prefetch links."
website "https://weibo.com/"

matches [
  # Weibo-specific headers
  { :search=>"headers[wbpctrace]", :name=>"Weibo Trace Header" },
  { :text=>"<link href=\"https://weibo.com\" rel=\"dns-prefetch\">", :name=>"Weibo DNS Prefetch" },
  { :regexp=>/<meta property="og:site_name"[^>]*content="[^"]*微博/i, :name=>"Weibo OG Meta Tag" }
]

end
