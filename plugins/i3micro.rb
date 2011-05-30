##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "i3micro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "Tilgin was founded under the name i3 micro technology in 1997 and develops equipment for IPTV and VOIP solutions. - Homepage: http://www.tilgin.com/"

# ShodanHQ results as at 2011-05-30 #
# 5,115 for i3micro -SIP

# Examples #
examples %w|
79.138.109.183
94.203.157.34
91.74.47.251
90.149.161.10
|

# Matches #
matches [

# VRG # Default Favicon
{ :model=>'VRG', :url=>"/favicon.ico", :md5=>"e4a509e78afca846cd0e6c0672797de5" },

]

# Passive #
def passive
	m=[]

	# Model Detection # WWW-Authenticate: Digest realm i3micro
	m << { :model=>@meta["www-authenticate"].scan(/^Digest realm="i3micro (V[A-Z]{2})", nonce/) } if @meta["www-authenticate"] =~ /^Digest realm="i3micro (V[A-Z]{2})", nonce/

	# Return passive matches
	m
end

end

