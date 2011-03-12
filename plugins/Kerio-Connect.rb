##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kerio-Connect" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Kerio Connect (previously Kerio MailServer) is the best email, messaging, collaboration and full groupware single server solution designed for small to medium organizations, offering full support for Outlook, Entourage, Apple Mail and iCal clients and more - Homeage: http://www.kerio.com/connect"

# ShodanHQ results as at 2011-03-13 #
# 9,241 for Kerio Connect
# 4,730 for Kerio MailServer

# Examples #
examples %w|
206.72.103.70
50.23.154.229
80.195.34.98
38.105.226.82
85.4.171.226
89.163.18.48
70.91.125.210
90.182.152.194
89.163.18.48
84.204.82.26
202.176.81.177
82.207.20.198
59.152.223.234
58.64.145.126
85.81.105.215
201.238.69.178
86.80.67.213
213.234.9.86
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Kerio (MailServer|Connect) (.+)$/)[0][1] } if @meta["server"] =~ /^Kerio (MailServer|Connect) (.+)$/

	# Return passive matches
	m

end

end

