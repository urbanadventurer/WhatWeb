##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "aspWebLinks" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.1"
description "Web app for categorizing links - homepage: http://www.fullrevolution.com/"

# 41 results for "powered by aspWebLinks" @ 2010-08-28
# 7 results for "powered by aspWebLinks" intitle:"aspWebLinks" @ 2010-08-28
examples %w|
www.wcschools.net/Departments/ttrc/links.asp
www.gatewaychurchdoncaster.org.uk/gateway/links.asp
www.pinnbeads.com/links.asp
alumni.x-aimas.net/v3/kptmkcas-linkdir.asp
www.metal-coven.dk/links/links.asp
portland2000.mine.nu/links.asp
www.laughing-rocks.org/links.asp
files.unitedbenefitadvisors.com/benefits2_2/shared/T4_Dynamic_Pages/ERC/links.asp
www.suonerie-mp3-gratis.com/directory/links.asp
dir.webnow.com.my/links.asp
www.pinnbeads.com/links.asp
users6.nofeehost.com/goalsurfer/links.asp
www.studentenwerk-aachen.de/links/links.asp
|

# Version detection
def passive
        m=[]

	# Powered by text
        if @body =~ /Powered By aspWebLinks ([\d\.]+) from <A HREF=[\"|\']*http:\/\/www.fullrevolution.com[\"|\']* TARGET=_blank>Full Revolution, Inc.<\/A>/
                version=@body.scan(/Powered By aspWebLinks ([\d\.]+) from <A HREF=[\"|\']*http:\/\/www.fullrevolution.com[\"|\']* TARGET=_blank>Full Revolution, Inc.<\/A>/)[0][0]
                m << {:version=>version}
        end

	if @body =~ /<A HREF=[\"|\']*http:\/\/www.fullrevolution.com[\"|\']* TARGET=_blank>Powered By aspWebLinks ([\d\.]+)<\/A>/
		version=@body.scan(/<A HREF=[\"|\']*http:\/\/www.fullrevolution.com[\"|\']* TARGET=_blank>Powered By aspWebLinks ([\d\.]+)<\/A>/)[0][0]
		m << {:version=>version}
	end

	# Default title
	if @body =~ /<title>aspWebLinks ([\d\.]+)<\/title>/
		version=@body.scan(/<title>aspWebLinks ([\d\.]+)<\/title>/)[0][0]
		 m << {:version=>version}
	end

        m

end


end

