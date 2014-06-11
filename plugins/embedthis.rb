##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Embedthis-AppWeb" do
author "Andrew Horton"
version "0.1"
description "Web server for embedded devices. Homepage: http://embedthis.com/products/appweb/embedded-web-server.html"



def passive
	m=[]
	unless @headers["server"].nil?
		m << { :string=>"Server header" } if @headers["server"] =~ /^Mbedthis-Appweb/i
		m << { :version=>@headers["server"].scan(/Mbedthis-Appweb\/(.*)/i) } if @headers["server"] =~ /Mbedthis-Appweb\/(.*)/i
	end
	m
end

end

