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
examples %w|
194.187.105.38/dat/job_sam80/_Buffer/Gather/KONTI/SoftWest/Putty/putty.log
communities.vmware.com/servlet/JiveServlet/download/878604-6499/esxcfg-info%20-s.log
filedb.experts-exchange.com/incoming/2009/06_w25/151028/asa.log
listas.asteriskbrasil.org/pipermail/asteriskbrasil/attachments/20070817/b5c1f182/asterisk-cvvv.obj
fc.isima.fr/~oliva/ZZ3/IDM/Benny/tp3/MadKit-4.2.0/plugins/designer/scripts/warbot/putty.log
fc.isima.fr/~oliva/ZZ3/IDM/Benny/tp3/MadKit-4.2.0/plugins/designer/scripts/warbot/src/images/putty.log
forums.citrix.com/servlet/JiveServlet/download/503-264633-1459365-29762/putty.log
hallaweb.jlab.org/tech/Detectors/public_html/junk/putty.log
jira.freeswitch.org/secure/attachment/12966/putty.log
qpage.ru/upload/iblock/2f5/2f5ef403c8092d1f2438cc884cc00e48.log
sewer.ps.pl/old/pliki/Programy/putty/putty.log
supportforums.cisco.com/servlet/JiveServlet/download/3093006-65716/putty.log
supportforums.cisco.com/servlet/JiveServlet/download/3086006-65352/putty.log
trac.freetz.org/raw-attachment/ticket/833/putty.log
trac.freetz.org/raw-attachment/ticket/935/7270v3neu.log
www.e-neta.jp/~oki/pocketwifi/pocketwifi.log
www.mail-archive.com/asteriskbrasil@listas.asteriskbrasil.org/msg16523/asterisk-cvvv.log
www.mail-archive.com/ccie_voice@onlinestudylist.com/msg04643/CMECUE.log
www.mail-archive.com/debian-laptop@lists.debian.org/msg51870/172.16.254.248_20100417-231446.log
www.mail-archive.com/debian-user@lists.debian.org/msg559537/putty.log
|

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

