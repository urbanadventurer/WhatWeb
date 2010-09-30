##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100

Plugin.define "UncommonHeaders" do
author "Andrew Horton"
version "0.2"
description "Uncommon HTTP server headers. The blacklist includes all the standard headers and many non standard but common ones. Interesting but fairly common headers should have their own plugins, eg. x-powered-by, server and x-aspnet-version. Info about headers can be found at www.http-stats.com"

# these are all normal
=begin
Date: Sun, 22 Nov 2009 13:27:04 GMT
Server: Apache/2.2.3 (Debian) mod_ssl/2.2.3 OpenSSL/0.9.8c
Cache-Control: no-cache, pre-check=0, post-check=0
Expires: 0
Pragma: no-cache
Vary: Accept-Encoding
Content-Type: text/html; charset=UTF-8
Via: 1.1 bc1
Connection: Keep-Alive
Set-Cookie: phpbb2mysql_data=a%3A2%3A%7Bs%3A11%3A%22autologinid%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22userid%22%3Bi%3A-1%3B%7D; expires=Mon, 22-Nov-2010 13:27:04 GMT; path=/
=end

def passive
	m=[]
	found=[]
	normal_headers=%w|accept-ranges age allow cache-control cachecontrol connection content-disposition content-encoding content-language content-length content-location content-md5 content-range content-type date etag expires host last-modified location mime-version p3p pragma proxy-authenticate refresh server set-cookie status trailer transfer-encoding vary via warning www-authenticate x-aspnet-version x-cache x-cache-lookup x-pad x-powered-by x-runtime x-ua-compatible|
	
	unless @meta.nil?	
		@meta.each do |x,y|
			unless normal_headers.include?(x)
				found << x
			end
		end
		
		unless found.empty?
			m << {:name=>"headers",:string=>found.join(",")}
		end
		
	end	
	m
end

end


