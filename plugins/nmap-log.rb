##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Nmap-Log" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-21
version "0.1"
description "This plugin identifies nmap logs and extracts the hostname, OS, active ports and nmap version."

# 32 results for "Starting nmap" "fyodor@insecure.org" (ext:txt | ext:log) @ 2010-10-21
examples %w|
web.textfiles.com/hacking/portscan.txt
kambing.ui.ac.id/onnopurbo/library/library-ref-ind/ref-ind-1/application/policy/mustika-ratu-case/capture2.txt
www.armory.com/~cerberus/tutorials/unix-black-hat.txt
www.ossec.net/rootkits/studies/knark.txt
staff.washington.edu/dittrich/misc/power.analysis.txt
www.linuxsecurity.com.br/info/microsoft/obscurity.nt.txt
staff.washington.edu/dittrich/talks/first/mgp00015.txt
nsh.altervista.org/docs/mdocs/neural/primipassi.txt
www.ataliba.eti.br/sections/old-hacking/unsekurity/texto1/detonakiddies.txt
|

matches [

# Get Nmap version # older version # 2.x +
{ :version=>/^Starting nmap V. ([\d\.]+) by fyodor@insecure.org/, :regexp_offset=>0 },

# Get Nmap version # newer versions # 4.x +
{ :version=>/^Starting Nmap ([\d\.]+) \( http:\/\/nmap.org \) at /, :regexp_offset=>0 },

]

# Extract details
def passive
	m=[]

	if @body =~ /^Interesting ports on ([^\r^\n]+)/ and (@body =~ /^Starting nmap / or @body =~ /^Starting Nmap /)

		# Hostname
		m << { :model=>@body.scan(/^Interesting ports on ([^\r^\n]+)/)[0][0] }

		# Operating System
		if @body =~ /Remote operating system guess: ([^\r^\n]*)/
			accounts=@body.scan(/^Remote operating system guess: ([^\r^\n]*)/)[0][0]
			m << { :account=>accounts }
		end

		# Ports
		if @body =~ /Port[\s]+State[\s]+Service/i

			if @body =~ /^([\d]{1,5})\/([udp|tcp]{3})[\s]+open[\s]+([a-z]+)/
				modules=@body.scan(/^([\d]{1,5})\/([udp|tcp]{3})[\s]+open[\s]+([a-z]+)/)
				m << { :module=>modules }
			end

		end
	
	end

	m

end

end

