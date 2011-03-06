##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "cloudflare" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.1"
description "ClouldFlare - https://www.cloudflare.com/"

examples %w|
http://yehg.net/
http://www.ornagai.com/
http://anti-virus.cloudflare.com
http://12flat.com/
http://techgeeks-online.com/
http://ps3blog.net/
http://techairlines.com/
http://manzwebdesigns.com/
http://jonesdoug.com/
199.27.132.117
199.27.135.56
199.27.135.145
199.27.135.104
199.27.128.121
199.27.129.67
199.27.129.160
199.27.129.28
199.27.130.224
199.27.131.170
199.27.128.218
199.27.132.54
199.27.132.221
199.27.132.132
199.27.130.46
199.27.134.115
199.27.132.182
199.27.132.124
199.27.134.48
199.27.128.67
199.27.129.163
199.27.134.93
199.27.130.164
199.27.131.92
199.27.130.149
199.27.134.73
199.27.129.193
199.27.129.31
199.27.130.102
199.27.131.65
199.27.129.47
199.27.129.150
199.27.130.84
199.27.134.103
199.27.128.83
199.27.130.171
199.27.134.52
199.27.130.181
199.27.130.55
|


matches [

{:name => 'access restricted iframe', :text => '<iframe frameborder="0" width="100%" height="100%" src="http://anti-virus.cloudflare.com/cdn-cgi/anti-virus-challenge?h='},

{:name => 'footer', :text => '&nbsp;&nbsp;Performance &amp; Security by <a id="FooterCloudFlare" href="https://www.cloudflare.com" target="_blank">CloudFlare</a>'},

]


def passive
	m=[]

	m << {:name=>"__cfduid cookie" } if @meta["set-cookie"] =~ /__cfduid/i
	m << {:name=>"server header" } if @meta["server"] =~ /cloudflare\-nginx/i

	m
end


end


