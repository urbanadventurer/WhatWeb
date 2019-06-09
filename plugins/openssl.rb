##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "OpenSSL"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-25
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "The OpenSSL Project is a collaborative effort to develop a robust, commercial-grade, full-featured, and Open Source toolkit implementing the Secure Sockets Layer (SSL v2/v3) and Transport Layer Security (TLS v1) protocols as well as a full-strength general purpose cryptography library."
website "http://www.openssl.org/"

# 2159865 ShodanHQ results for "Server: OpenSSL"

matches [
	# HTTP Server header
	{ :regexp=>/OpenSSL/, :search=>"headers[server]" },

	# Version detection
	{ :version=>/[^\r^\n]*OpenSSL\/([^\s^\r^\n]+)/, :search=>"headers[server]" },

]

end

