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

examples %w|
morningstarsecurity.com
somethingawful.com
wordpress.com
phpbb.com
mozilla.org
4chan.org
|

# Extract subdomains
def passive
	m=[]

	if @body =~ /<[^>]+[href|src][\s]*=[\s]*[\'|\"]?http:\/\/([^\/^\'^\"^\s^>]+)\.#{Regexp.escape(@base_uri.to_s.gsub("http://www.", "").gsub("http://", "").split('/')[0])}/i
               version=@body.scan(/<[^>]+[href|src]+[\s]*=[\s]*[\'|\"]?http:\/\/([^\/^\'^\"^\s^>]+)\.#{Regexp.escape(@base_uri.to_s.gsub("http://www.", "").gsub("http://", "").split('/')[0])}/i)
		m << { :version=>version.uniq }
	end

	m

end

end

