##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PuTTY-Log" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.1"
description "This plugin identifies instances of PuTTY log files and attempts to extract usernames, servers and software versions."

# 91 results for "=~=~=~=~=~=~=~=~=~=~=~= PuTTY log " ext:log @ 2010-10-15


matches [

# Log header
{ :regexp=>/=~=~=~=~=~=~=~=~=~=~=~= PuTTY log [0-9]{4}.[0-9]{2}.[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} =~=~=~=~=~=~=~=~=~=~=~=/ },

]

# Extract username, server & software versions.
def passive
	m=[]

	if @body =~ /=~=~=~=~=~=~=~=~=~=~=~= PuTTY log [0-9]{4}.[0-9]{2}.[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} =~=~=~=~=~=~=~=~=~=~=~=/

		# Telnet
		if @body =~ /^Connected to ([^\s]+)[\s]+Escape character is '\^\]'/
			modules=@body.scan(/^Connected to ([^\s]+)[\s]+Escape character is '\^\]'/)
			m << {:module=>modules}
		end

		# SSH
		if @body =~ /^([0-9a-zA-Z\-\.\@_]+)'s password:/
			modules=@body.scan(/^([0-9a-zA-Z\-\.\@_]+)'s password:/)
			m << {:module=>modules}
		elsif @body =~ /^login as: ([0-9a-zA-Z\-\._]+)/
			modules=@body.scan(/^login as: ([0-9a-zA-Z\-\._]+)/)
			m << {:module=>modules}
		end

		if @body =~ /^Event Log: Writing new session log \(SSH packets mode\) to file: /
			if @body =~ /^Event Log: Looking up host "([^\"]+)"/
				account=@body.scan(/^Event Log: Looking up host "([^\"]+)"/)
				m << {:account=>account}
			end
			if @body =~ /^Event Log: Server version:[\s]+([^\s]+)/
				version=@body.scan(/^Event Log: Server version:[\s]+([^\s]+)/)
				m << {:version=>version}
			end
		end

	end

	m

end

end

