##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SPIP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-12
version "0.1"
description "SPIP is a publishing system for the Internet in which great importance is attached to collaborative working, to multilingual environments, and to simplicity of use for web authors. - Homepage: http://www.spip.net/"

# ShodanHQ results as at 2011-02-12 #
# 1,666 for Composed-By spip # 1,229 in France
# 1,382 for x-spip-cache # 1,033 in France

# Examples #
examples %w|
http://81.201.178.225/
http://82.151.64.2/
http://82.229.103.245/
http://91.207.254.82/
http://62.58.108.110/
http://147.210.232.193/
http://195.220.70.6/
http://194.199.99.4/
http://213.139.127.54/
http://213.251.187.134/
http://217.70.191.175/
|

# Passive #
def passive
	m=[]

	# Version Detection # Composed-By HTTP Header
	m << { :version=>@meta["composed-by"].scan(/SPIP ([^@]{1,10}) @ www\.spip\.net/) } if @meta["composed-by"] =~ /SPIP ([^@]{1,10}) @ www\.spip\.net/

	# Composed-By HTTP Header
	m << { :name=>"Composed-By HTTP Header" } if @meta["composed-by"] =~ /SPIP @ www\.spip\.net/

	# x-spip-cache
	m << { :name=>"x-spip-cache" } unless @meta["x-spip-cache"].nil?

	# Return passive matches
	m
end

end


