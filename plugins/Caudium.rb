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

# Examples #
examples %w|
109.252.249.154
195.70.32.144
89.140.182.99
141.108.20.11
89.31.236.7
193.149.48.8
195.70.32.132
216.158.103.42
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].to_s.scan(/^[\s]*Caudium\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /^[\s]*Caudium\/([^\s^\r^\n]+)/i

	# Catch-All # HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"].to_s =~ /^[\s]*Caudium[^\s^\r^\n]*/i

	# Pike Version Detection # HTTP X-Got-Fish Header
	m << { :module=>"Pike:"+@meta["x-got-fish"].to_s.scan(/^[\s]*Pike v([^\r^\n]+)/i).to_s } if @meta["x-got-fish"].to_s =~ /^[\s]*Pike v([^\r^\n]+)/i

	m

end

end

