##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-22 #
# Updated regex
##
Plugin.define "Nmap-Log" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-21
version "0.2"
description "This plugin identifies nmap plain-text logs and extracts the hostname, OS, active ports and nmap version. It does not work for logs in the XML file format. - Homepage: http://www.insecure.org/nmap/"

# Google results as at 2010-10-21 #
# 32 for "Starting nmap" "fyodor@insecure.org" (ext:txt | ext:log)

# Examples #
examples %w|
web.textfiles.com/hacking/portscan.txt
www.armory.com/~cerberus/tutorials/unix-black-hat.txt
www.ossec.net/rootkits/studies/knark.txt
staff.washington.edu/dittrich/misc/power.analysis.txt
www.linuxsecurity.com.br/info/microsoft/obscurity.nt.txt
staff.washington.edu/dittrich/talks/first/mgp00015.txt
nsh.altervista.org/docs/mdocs/neural/primipassi.txt
www.ataliba.eti.br/sections/old-hacking/unsekurity/texto1/detonakiddies.txt
|

# Passive #
def passive
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

