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

examples %w| 114.74.149.201 |

def passive
	m=[]
	unless @meta["server"].nil?
		m << { :string=>"Server header" } if @meta["server"] =~ /^Mbedthis-Appweb/i
		m << { :version=>@meta["server"].scan(/Mbedthis-Appweb\/(.*)/i) } if @meta["server"] =~ /Mbedthis-Appweb\/(.*)/i
	end
	m
end

end

