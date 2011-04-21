##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpFox" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-21
version "0.1"
description "phpFox is a featured packed social networking solution that creates communities with features found on major social networking websites like Facebook and MySpace. - Homepage: http://www.phpfox.com/"

# 336 for "Powered By phpFox Version"

# Dorks #
dorks [
'"Powered By phpFox Version"'
]

# Examples #
examples %w|
live.phpfox.com/demo/
www.mytalent.com
www.gospelville.org/community/
www.stylevice.com
www.power-9-network.com
www.arrowchat.com/demo.phpfox/index.php
www.eskysite.com
www.rpmspace.com
cliquelink.com
stpetersburgbeach.com
demo.teamwurkz.com/v2demo-flava/
www.lesbos-island.org
www.ethiomusicians.com
phpfoxstyles.com/demo2/
|

# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/Powered By <a href="http:\/\/www\.phpfox\.com\/"[^>]*>phpFoX<\/a> Version ([\d\.]+)/ },
{ :version=>/<a href="http:\/\/www\.phpfox\.com\/"[^>]*>Powered by phpFoX Version ([\d\.]+)<\/a>/ },

]

# Passive #
def passive
	m=[]

	# Meta Generator (is base64 of "phpFox") or Meta Author
	if @body =~ /<meta name="generator" content="cGhwRm94" \/>/ or @body =~ /<meta name="author" content="phpFox" \/>/

		m << { :name=>"Meta Tags" }

		# Version Detection # Meta Version # base64 encoded
		if @body =~ /<meta name="version" content="([^"]+)" \/>/
			version=@body.scan(/<meta name="version" content="([^"]+)" \/>/).first.to_s
			m << { :version=>Base64.decode64(version).to_s }
		end
	end

	# phpfox(x)visit cookie
	if @meta["set-cookie"] =~ /phpfox[\d]visit=[\d]+;/
		m << { :name=>"phpfox(x)visit cookie" }
	end

	# Return passive matches
	m
end

end


