##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
Plugin.define "Caudium" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-02
version "0.1"
description "Caudium is the name of a GPL-ed (free for commercial and personal use) web server written in Pike and in C. It is originally based on the Roxen Challenger 1.3 code base. - homepage: http://www.caudium.net/"
# More info: http://www.http-stats.com/X-Got-Fish

# About 209 ShodanHQ results for Server: Caudium @ 2011-08-02



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].to_s.scan(/^[\s]*Caudium\/([^\s^\r^\n]+)/i).flatten } if @headers["server"].to_s =~ /^[\s]*Caudium\/([^\s^\r^\n]+)/i

	# Catch-All # HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @headers["server"].to_s =~ /^[\s]*Caudium[^\s^\r^\n]*/i

	# Pike Version Detection # HTTP X-Got-Fish Header
	m << { :module=>"Pike:"+@headers["x-got-fish"].to_s.scan(/^[\s]*Pike v([^\r^\n]+)/i).flatten.first.to_s } if @headers["x-got-fish"].to_s =~ /^[\s]*Pike v([^\r^\n]+)/i

	m

end

end

