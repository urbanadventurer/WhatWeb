##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IceWarp-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "IceWarp Unified Communications Server is a fully integrated email server, webmail server, groupware, instant messaging, VoIP / SIP, text messaging. - Homepage: http://www.icewarp.com/"

# ShodanHQ results as at 2011-03-17 #
# 6,632 for IceWarp -WebSrv
#   259 for IceWarp WebSrv

# Examples #
examples %w|
demo.icewarp.com
74.211.241.235
62.225.1.71
97.67.51.250
151.12.1.16
82.177.2.72
217.149.195.217
193.179.105.241
80.120.70.41
139.146.150.222
80.120.70.41
83.97.98.12
97.65.121.91
202.67.226.70
70.85.41.166
212.154.36.82
203.116.95.32
218.211.252.77
87.253.145.122
213.115.93.91
mail.alshaya.com
mail.moffittsystems.com:64000
mail.nitc-tankers.com:32000
www.richhabitat.net
mail.platinbox.org:8080
post.ird.com
|

# Passive #
def passive
	m=[]

	# Version Detection # IceWarp
	m << { :version=>@meta["server"].scan(/^IceWarp\/(.+)$/) } if @meta["server"] =~ /^IceWarp( WebSrv)?\/(.+)$/

	# Version Detection # IceWarp WebSrv
	m << { :version=>@meta["server"].scan(/^IceWarp WebSrv\/(.+)$/) } if @meta["server"] =~ /^IceWarp( WebSrv)?\/(.+)$/

	# Return passive matches
	m

end

end

