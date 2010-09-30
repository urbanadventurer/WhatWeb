##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Traidnt-UP" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-26
version "0.1"
description "Traidnt UP - homepage: http://www.traidnt.net"

# 470 results for "powered by Traidnt UP Version" @ 2010-09-26
examples %w|
shjoonalhajri.net
moon-14.net
iraqeon.net
slayl-abs.net
up.sa-l.com
3eeb.alkrsan.net
iraqiyat.net/up/
up.sitamol.net
up.klgcol.net
ebnelqady.com
alfdol.net
ll1ll.com
a5fe.net
hanasa-up.ueuo.com
up-zazlux.co.cc
up.esgmarkets.com
www.not-world.com
www.baghdadyat.com
www.7fz.net
www.mishooo.org
www.sabagate.com
www.z3lanh.net
www.3adany.net
www.2upl.com
www.silence-gate.org
www.14nooor.net
www.noor-alyaqeen.com/up/
www.sada9.com
www.m1111.net
www.up.up-alswalf.com
www.kber-g.co.cc
www.iqpic.com
www.turaif.me/upload/
www.vb-k.com/up/
www.1rmad.com/up/
|

matches [

# HTML comment
{ :text=>'<!-- # START HEDARE -->' },

# Powered by text
{ :text=>"<font color='#000080'><a href='http://traidnt.net' target='_blank'>" },
{ :text=>"			<span style='text-decoration: none'><font color='#000000'>Traidnt&nbsp;UP</font></span></a></font></span></b>" },

]

# Version detection
def passive
        m=[]

	# Powered by text
        if @body =~ /<p align='center' dir='ltr'>Powered by Traidnt UP Version ([\d\.]+)<\/p>/
                version=@body.scan(/<p align='center' dir='ltr'>Powered by Traidnt UP Version ([\d\.]+)<\/p>/)[0][0]
                m << {:version=>version}
        end

	if @body =~ /<div class="footer">Powered by <a href="http:\/\/traidnt.net" target="_blank">TRAIDNT UP<\/a> Version ([\d\.]+)[\s]*<\/div>/
		version=@body.scan(/<div class="footer">Powered by <a href="http:\/\/traidnt.net" target="_blank">TRAIDNT UP<\/a> Version ([\d\.]+)[\s]*<\/div>/)[0][0]
		 m << {:version=>version}
	end

	if @body =~ /			<span style='text-decoration: none'><font color='#000000'>Traidnt&nbsp;UP<\/font><\/span><\/a><\/font><\/span><\/b>/
		if @body =~ /			Version ([\d\.]+)/
			version=@body.scan(/			Version ([\d\.]+)/)[0][0]
			m << {:version=>version}
		end
	end

        m

end


end

