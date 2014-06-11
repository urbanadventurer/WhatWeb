##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WhatsUp" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "WhatsUp - Network and Server Management Software - Homepage: http://www.whatsupgold.com/"

# ShodanHQ results as at 2011-03-13 #
# 1,127 for WhatsUp -Gold
#   647 for WhatsUp -ipswitch



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :string=>"Gold", :version=>@headers["server"].scan(/^WhatsUp_Gold\/([\d\.]+)/) } if @headers["server"] =~ /^WhatsUp_Gold\/([\d\.]+)/

	# WWW-Authenticate # HTTP Server Header
	m << { :string=>"Gold", :certainty=>75, :name=>"WWW-Authenticate" } if @headers["www-authenticate"] =~ /^Basic realm="WhatsUp[\s]?Gold"/

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @headers["server"] =~ /^WhatsUp/

	# Return passive matches
	m

end

end

