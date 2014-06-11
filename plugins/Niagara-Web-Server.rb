##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Niagara-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "Niagara Web Server"

# 8073 ShodanHQ results for "Niagara web server"


# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@headers["server"].scan(/Niagara Web Server\/([\d\.]+)/).flatten } if @headers["server"] =~ /Niagara Web Server\/([\d\.]+)/

	# HTTP Niagara-Release Header
	m << { :version=>@headers["niagara-release"].to_s } unless @headers["niagara-release"].nil?

	# HTTP Niagara-ffs Header
	m << { :name=>"Niagara-ffs HTTP Header" } unless @headers["niagara-ffs"].nil?

	m

end

end

