##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Added aggressive `/robots.txt` retrieval
##
Plugin.define "robots.txt" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-22
version "0.1"
description "This plugin identifies robots.txt files and extracts both allowed and disallowed directories."

examples %w|
www.google.com
morningstarsecurity.com
itsecuritysolutions.org
whatweb.net
|

# Passive # Extract directories if current file is robots.txt
def passive
	m=[]

	if @base_uri.to_s.split('/').last =~ /^robots.txt$/i and @body =~ /User-agent:/i

		# Disallow
		if @body =~ /^Disallow:[\s]+([^\r^\n]*)/i
			modules=@body.scan(/^Disallow:[\s]+([^\r^\n]*)/i)
			m << { :modules=>modules.uniq }
		end

		# Allow
		if @body =~ /^Allow:[\s]+([^\r^\n]*)/i
			modules=@body.scan(/^Allow:[\s]+([^\r^\n]*)/i)
			m << { :modules=>modules.uniq }
		end

	end

	m

end

# Aggressive # Fetch /robots.txt and extract directories
def aggressive
	m=[]

	target = URI.join(@base_uri.to_s,"/robots.txt").to_s
	status,url,ip,body,headers=open_target(target)

	# Disallow
	if body =~ /^Disallow:[\s]+([^\r^\n]*)/i
		modules=body.scan(/^Disallow:[\s]+([^\r^\n]*)/i)
		m << { :modules=>modules.uniq }
	end

	# Allow
	if body =~ /^Allow:[\s]+([^\r^\n]*)/i
		modules=body.scan(/^Allow:[\s]+([^\r^\n]*)/i)
		m << { :modules=>modules.uniq }
	end

	m

end

end

