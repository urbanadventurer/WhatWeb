##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mirapoint-Email-Appliance" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-04
version "0.1"
description "Mirapoint Email Appliance is a Unix-like standards-compliant black-box e-mail server, with built-in anti-spam, anti-virus, webmail, POP, IMAP, calendar, and LDAP routing options available. System configuration and maintenance is done through a web interface, or through SSH or telnet access to a command line interpreter (CLI). Full access to the Unix-like Messaging Operating System (MOS) is not available. Depending on the model and configuration the appliances can be used as email routers, user mail servers, or as an all-in-one server. - Homepage: http://www.mirapoint.com/index.php?id=products"

# More Info #
# http://en.wikipedia.org/wiki/Mirapoint_Email_Appliance
# http://www.mirapoint.com/index.php?id=ds_wp

# ShodanHQ results as at 2011-08-04 #
# 686 for Mirapoint

# Examples #
examples %w|
mail.mirapoint.com
junk.mail.vt.edu
mirapoint.utpb.edu
webmail.hunter.cuny.edu
webmail.uow.edu.au
mirapoint.jcu.edu
mail.umd.edu
mail.iis.u-tokyo.ac.jp
https://usnaemail.usna.edu
207.172.157.86
119.254.72.230
20.132.170.3
63.76.154.140
63.107.133.42
209.143.0.202
66.100.26.50
211.99.195.158
207.172.157.70
69.26.27.14
153.91.1.114
219.142.42.8
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Mirapoint/

		m << { :name=>"HTTP Server Header" }

		# Version Detection
		if @headers["server"] =~ /^Mirapoint\/([^\s]+)$/
			m << { :version=>"#{$1}" }
		end
	end

	# Return passive matches
	m
end
end

