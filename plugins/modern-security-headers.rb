##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Modern-Security-Headers"
authors [
  "Andrew Horton", # v0.1 # 2025-08-02 # Initial version
]
version "0.1"
description "Modern web security headers that implement defense-in-depth protection for web applications."
website "https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers#security"

matches [
  # Permission and Feature policies
  { :search=>"headers[permissions-policy]", :string=>true, :name=>"Permissions Policy" },
  { :search=>"headers[feature-policy]", :string=>true, :name=>"Feature Policy (Legacy)" },
  
  # Cross-Origin policies
  { :search=>"headers[cross-origin-resource-policy]", :string=>true, :name=>"Cross-Origin Resource Policy" },
  { :search=>"headers[cross-origin-opener-policy]", :string=>true, :name=>"Cross-Origin Opener Policy" },
  { :search=>"headers[cross-origin-embedder-policy]", :string=>true, :name=>"Cross-Origin Embedder Policy" },
  
  # Other security headers
  { :search=>"headers[referrer-policy]", :name=>"Referrer Policy" },
  { :search=>"headers[clear-site-data]", :name=>"Clear Site Data" },
  { :search=>"headers[x-content-type-options]", :name=>"X-Content-Type-Options" },
  { :search=>"headers[x-xss-protection]", :name=>"X-XSS-Protection" },
  { :search=>"headers[expect-ct]", :name=>"Expect-CT" }
]

end
