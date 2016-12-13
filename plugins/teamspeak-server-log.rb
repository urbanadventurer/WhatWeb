##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TeamSpeak-Server-Log" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.1"
description "This plugin extracts the username and password from TeamSpeak server.log files."

# 15 results for "WARNING,Info,SERVER" ext:log @ 2010-10-15


matches [

# Server version detection
{ :version=>/^[0-9]{2}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2},ALL,Info,server,[\s]+Server version: ([^\r^\n]+)/ },

]

# Extract passwords
def passive
	m=[]

	if @body =~ /-------------- log started at /

		if @body =~ /^[0-9]{2}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2},WARNING,Info,SERVER,	[super]*admin account info: username: [^\s]+ password: ([^\r^\n]+)/
			accounts=@body.scan(/^[0-9]{2}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2},WARNING,Info,SERVER,	[super]*admin account info: username: [^\s]+ password: ([^\r^\n]+)/)
			m << {:account=>accounts}
		end

	end

	m

end

end

