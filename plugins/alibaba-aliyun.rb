##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Alibaba-Aliyun"
authors [
  "Andrew Horton", # v0.1 # 2025-08-02 # Initial version
]
version "0.1"
description "Alibaba Cloud (Aliyun) infrastructure and services identified by unique headers and server signatures."
website "https://www.alibabagroup.com/en-US/"

matches [
  # Alibaba-specific headers
  { :search=>"headers[eagleeye-traceid]", :name=>"Alibaba EagleEye Trace" },
  { :search=>"headers[server]", :regexp=>/tengine/i, :name=>"Tengine (Alibaba Server)" },
  { :search=>"headers[via]", :regexp=>/aliyun|alicdn/i, :name=>"Aliyun CDN" },
  { :search=>"headers[eagleid]", :name=>"Alibaba EagleId Header" }
]

end
