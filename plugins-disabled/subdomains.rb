##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Subdomains" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-18
version "0.1"
description "This plugin finds and extracts subdomains from the href and src parameters of any HTML elements it finds."



# Passive #
def passive
	m=[]

	# Extract subdomains
	if @body =~ /<[^>]+[href|src][\s]*=[\s]*[\'|\"]?http:\/\/([^\/^\'^\"^\s^>]+)\.#{Regexp.escape(@base_uri.to_s.gsub("http://www.", "").gsub("http://", "").split('/')[0])}/i
		string=@body.scan(/<[^>]+[href|src]+[\s]*=[\s]*[\'|\"]?http:\/\/([^\/^\'^\"^\s^>]+)\.#{Regexp.escape(@base_uri.to_s.gsub("http://www.", "").gsub("http://", "").split('/')[0])}/i)
		m << { :string=>string.uniq }
	end

	# Return passive matches
	m
end

end

