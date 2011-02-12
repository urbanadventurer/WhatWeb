##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenSSL" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-25
version "0.1"
description "The OpenSSL Project is a collaborative effort to develop a robust, commercial-grade, full-featured, and Open Source toolkit implementing the Secure Sockets Layer (SSL v2/v3) and Transport Layer Security (TLS v1) protocols as well as a full-strength general purpose cryptography library. - homepage: http://www.openssl.org/"

# 2159865 ShodanHQ results for "Server: OpenSSL"
examples %w|
209.162.204.63
165.106.1.68
199.236.118.36
24.131.115.87
81.92.160.211
174.120.221.119
199.237.207.103
212.159.99.18
74.80.179.75
66.147.225.92
67.214.171.147
|

# HTTP Header
def passive
	m=[]

	# Version detection
	m << { :version=>@meta["server"].scan(/[^\r^\n]*OpenSSL\/([^\s^\r^\n]+)/) } if @meta["server"].to_s =~ /[^\r^\n]*OpenSSL\/([^\s^\r^\n]+)/

	m

end

end

