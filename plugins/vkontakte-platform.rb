##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "VKontakte-Platform"
authors [
  "Andrew Horton", # v0.1 # 2025-08-02 # Initial version
]
version "0.1"
description "VKontakte (VK) infrastructure identified by server type and specific elements."
website "https://vk.com/"

matches [
  # Server signature
  { :search=>"headers[server]", :regexp=>/^kittenx/i, :name=>"VK Kittenx Server" },
  
  # VK API and elements
  { :regexp=>/<script[^>]*src="\/\/vk\.com\/js\/api\/openapi\.js/i, :name=>"VK API Script" },
  { :text=>"<meta property=\"og:site_name\" content=\"VK\">", :name=>"VK OG Meta Tag" }
]

end
