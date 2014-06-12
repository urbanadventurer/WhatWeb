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

# Google results as at 2011-04-12 #
# 14 for "Performance & Security by Cloudflare"

# Dorks #
dorks [
'"Performance & Security by Cloudflare"'
]



# Matches #
matches [

{:name => 'access restricted iframe', :text => '<iframe frameborder="0" width="100%" height="100%" src="http://anti-virus.cloudflare.com/cdn-cgi/anti-virus-challenge?h='},

{:name => 'footer', :text => '&nbsp;&nbsp;Performance &amp; Security by <a id="FooterCloudFlare" href="https://www.cloudflare.com" target="_blank">CloudFlare</a>'},

]

# Passive #
def passive
	m=[]

	m << {:name=>"__cfduid cookie" } if @headers["set-cookie"] =~ /__cfduid/i
	m << {:name=>"server header" } if @headers["server"] =~ /cloudflare\-nginx/i

	# Return passive matches
	m
end

end


