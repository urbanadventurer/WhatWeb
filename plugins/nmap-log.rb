##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Nmap-Log"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-21
  # v0.2 # 2011-03-22 # Updated regex. 
]
version "0.2"
description "This plugin identifies nmap plain-text logs and extracts the hostname, OS, active ports and nmap version. It does not work for logs in the XML file format."
website "http://www.insecure.org/nmap/"

# Google results as at 2010-10-21 #
# 32 for "Starting nmap" "fyodor@insecure.org" (ext:txt | ext:log)



# Passive #
passive do
	m=[]

	# Extract details
	if @body =~ /^Interesting ports on (.+):[\r]?$/ and @body =~ /^Starting (n|N)map /

		# Version # Newer versions # 4.x
		m << { :version=>@body.scan(/^Starting Nmap ([^\s]+) \( http:\/\/nmap.org \) at /) } if @body =~ /^Starting Nmap ([^\s]+) \( http:\/\/nmap.org \) at /

		# Version # Older version # 2.x
		m << { :version=>@body.scan(/^Starting nmap V. ([^\s]+) by fyodor@insecure.org/) } if @body =~ /^Starting nmap V. ([^\s]+) by fyodor@insecure.org/

		# Target
		m << { :string=>"Target: "+@body.scan(/^Interesting ports on (.+):[\r]?$/)[0][0] }

		# Operating System
		m << { :string=>"OS: "+@body.scan(/^Remote operating system guess: ([^\r^\n]*)/)[0][0] } if @body =~ /Remote operating system guess: ([^\r^\n]*)/

		# Ports
		if @body =~ /Port[\s]+State[\s]+Service/i and @body =~ /^([\d]{1,5})\/(udp|tcp)[\s]+open[\s]+([a-z]+)/

			@body.scan(/^([\d]{1,5})\/(udp|tcp)[\s]+open[\s]+([a-z]+)/).each { |service| m << { :string=>service[0]+"("+service[1]+")("+service[2]+")" } if service.size == 3 and service[0] =~ /[\d]{1,5}/ }

		end
	
	end

	# Return passive matches
	m
end

end

