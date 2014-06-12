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


# HTTP Header
def passive
	m=[]

	# Version detection
	m << { :version=>@headers["server"].scan(/[^\r^\n]*OpenSSL\/([^\s^\r^\n]+)/).flatten } if @headers["server"].to_s =~ /[^\r^\n]*OpenSSL\/([^\s^\r^\n]+)/

	m

end

end

