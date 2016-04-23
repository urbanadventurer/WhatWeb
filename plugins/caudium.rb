##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved 2 patterns from passive function to matches[]
##
Plugin.define "Caudium" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-02
version "0.2"
description "Caudium is the name of a GPL-ed (free for commercial and personal use) web server written in Pike and in C. It is originally based on the Roxen Challenger 1.3 code base."
website "http://www.caudium.net/"
# More info: http://www.http-stats.com/X-Got-Fish

# About 209 ShodanHQ results for Server: Caudium @ 2011-08-02

matches [
	# Version Detection # HTTP Server Header
	{:version=>/^[\s]*Caudium\/([^\s^\r^\n]+)/, :search=>"headers[server]"},

	# Catch-All # HTTP Server Header
	{:name=>"HTTP Server Header", :regexp=>/^[\s]*Caudium[^\s^\r^\n]*/, :search=>"headers[server]"},

]

# Passive #
def passive
	m=[]

	# Pike Version Detection # HTTP X-Got-Fish Header
	m << { :module=>"Pike:"+@headers["x-got-fish"].to_s.scan(/^[\s]*Pike v([^\r^\n]+)/i).flatten.first.to_s } if @headers["x-got-fish"].to_s =~ /^[\s]*Pike v([^\r^\n]+)/i

	m

end

end

