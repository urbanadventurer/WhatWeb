##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Indico" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-11
version "0.1"
description "Indico - Integrated Digital Conference - allows you to manage complex conferences, workshops and meetings. - Homepage: http://indico.cern.ch/"

# Google results as at 2011-05-11 #
# 27 for "powered by Indico" inurl:wcalendar.py

# ShodanHQ results as at 2011-05-11 #
# 38 for MAKACSESSION

# Dorks #
dorks [
'"powered by Indico" inurl:wcalendar.py'
]

# Examples #
examples %w|
indico.cern.ch
indico.fnal.gov
indico.ihep.ac.cn
www.npl.illinois.edu/cipanp/
rich2010.in2p3.fr/indico/
dmtpc.mit.edu/MaKaC/
lhcbweb.bo.infn.it/MaKaC/
conferences.imfm.si
133.43.118.10
192.167.0.224
128.104.255.35
192.16.185.190
148.247.182.83
130.235.185.138
193.2.67.249
193.55.211.33
152.106.18.3
193.144.240.4
|

# Matches #
matches [

# td class
{ :text=>'<td class="menuConfTopCell" align="left" valign="bottom">' },

# Version Detection # Powered by link
{ :version=>/<\/span>&nbsp;Powered by(\ CERN)? <a href="http:\/\/cern\.ch\/indico">Indico ([^<]+)<\/a>&nbsp;<span class="separator">/, :offset=>1 },

]

# Passive #
def passive
	m=[]

	# MAKACSESSION Cookie
	m << { :name=>"MAKACSESSION Cookie" } if @headers["set-cookie"] =~ /^MAKACSESSION=[A-Z\d]{16}; Path=/

	# Return passive matches
	m
end

end

