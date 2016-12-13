##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Added content-type application/perl match
##
Plugin.define "Perl" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.2"
description "Perl is a highly capable, feature-rich programming language with over 22 years of development."
website "http://www.perl.org/"

# About 309934 ShodanHQ results for "server: perl/v" @ 2010-10-26


# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@headers["server"].to_s.scan(/[^\r^\n]*Perl\/v([^\s^\r^\n]+)/i).flatten } if @headers["server"].to_s =~ /[^\r^\n]*Perl\/v([^\s^\r^\n]+)/i

	# HTTP Content-Type Header
	m << { :name=>"application/perl" } if @headers["content-type"] =~ /application\/perl/i

	m

end

end

