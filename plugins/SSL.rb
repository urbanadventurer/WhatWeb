##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SSL-Certificate" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-29
version "0.1"
description "This plugin retrieves details from SSL certificate files."

# 193 results for "-----BEGIN CERTIFICATE-----" "Signature Algorithm"  "-----END CERTIFICATE-----" ext:pem
# 6 results for "-----BEGIN CERTIFICATE-----" "Signature Algorithm"  "-----END CERTIFICATE-----" ext:der
examples %w|
h1.usherca.org/aia/ca.pem
193.140.100.140/servisler/sertifika/valid_cert/signed-certs/0262.pem
www.eurogrid.org/ca/valid-certs/800041.pem
www.tatemura.net/term_3.07/cert_tatemura.pem
deniz.ulakbim.gov.tr/servisler/sertifika/valid_cert/signed-certs/024D.pem
http://mail.madnet.ro/madnet.der
|

# Passive # Extract certificate details
def passive
	m=[]

	if @body =~ /-----BEGIN CERTIFICATE-----/ and @body =~ /-----END CERTIFICATE-----/ and @body =~ /Public Key Algorithm:/ and @body =~ /Signature Algorithm:/ and @body =~ /Issuer:/

		m << { :string=>"Issuer: "+@body.scan(/Issuer:[\s]*([^\r^\n]+)/)[0].to_s+" ("+@body.scan(/RSA Public Key:[\s]*\(([^\)]+)\)/)[0].to_s+") ("+@body.scan(/^[\s]+Not After : ([^\r^\n]+)/)[0].to_s+")" } if @body =~ /Issuer:[\s]*([^\r^\n]+)/ and @body =~ /RSA Public Key:[\s]*\(([^\)]+)\)/ and @body =~ /^[\s]+Not After : ([^\r^\n]+)/

	end

	m

end

end

