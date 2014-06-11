##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Added content-type match
##
Plugin.define "SSL-Certificate" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-29
version "0.2"
description "This plugin retrieves details from SSL certificate files."

# 193 results for "-----BEGIN CERTIFICATE-----" "Signature Algorithm"  "-----END CERTIFICATE-----" ext:pem
# 6 results for "-----BEGIN CERTIFICATE-----" "Signature Algorithm"  "-----END CERTIFICATE-----" ext:der


def passive
	m=[]

	# Extract certificate details
	if @body =~ /^-----BEGIN CERTIFICATE-----/ and @body =~ /^-----END CERTIFICATE-----/ and @body =~ /Public Key Algorithm:/ and @body =~ /Signature Algorithm:/ and @body =~ /Issuer:/

		m << { :name=>"SSL Cert Text" }
		m << { :string=>@body.scan(/Issuer:[\s]*([^\r^\n]+)/)[0].to_s+" ("+@body.scan(/RSA Public Key:[\s]*\(([^\)]+)\)/).flatten.first+") ("+@body.scan(/^[\s]+Not After : ([^\r^\n]+)/).flatten.first+")" } if @body =~ /Issuer:[\s]*([^\r^\n]+)/ and @body =~ /RSA Public Key:[\s]*\(([^\)]+)\)/ and @body =~ /^[\s]+Not After : ([^\r^\n]+)/

	end

	# Content type
	m << { :string=>"x-x509-ca-cert" } if @headers["Content-Type"] =~ /^[\s]*application\/x-x509-ca-cert/

	m

end

end

