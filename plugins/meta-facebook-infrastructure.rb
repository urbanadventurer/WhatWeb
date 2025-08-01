##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Meta-Facebook-Infrastructure"
authors [
  "Andrew Horton", # v0.1 # 2025-08-02 # Initial version
]
version "0.1"
description "Facebook's Proxygen server technology and other Meta/Facebook infrastructure identifiers."
website "https://engineering.fb.com/2014/11/05/production-engineering/introducing-proxygen-facebook-s-c-http-framework/"

matches [
  # Server header
  { :search=>"headers[server]", :regexp=>/^proxygen-bolt/i, :name=>"Facebook Proxygen Server" },
  
  # Debug headers
  { :search=>"headers[x-fb-debug]", :name=>"Facebook Debug Header" },
  { :search=>"headers[x-fb-trip-id]", :name=>"Facebook Trip ID" },
  
  # Meta tags
  { :regexp=>/<meta property="og:site_name"[^>]*content="Facebook"/i, :name=>"Facebook OG Meta Tag" },
  { :regexp=>/<meta property="og:site_name"[^>]*content="Instagram"/i, :name=>"Instagram OG Meta Tag" }
]

end
