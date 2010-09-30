##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dell-Printer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.1"
description "Dell printer web frontend - http://www.dell.com/" 

# 1 result for intitle:"Dell *" inurl:port_0 @ 2010-07-22
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1281
# 1 result for intitle:"configuration" inurl:port_0 @ 2010-07-22
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1318
# 4 results for "Online Help" "Order Supplies" intitle:"Laser Printer" intitle:dell @ 2010-07-22
# 2 results for inurl:"port_255" -htm intitle:"Printer Settings" @ 2010-07-22
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1221
examples %w|
128.192.89.71
www.perris-world.com
128.125.132.215
141.20.43.243
129.25.9.220
biomech-va.media.mit.edu
et000400757849.emporia.edu
|

def passive
        m=[]

	# Tested models: 3100cn / 5100cn / M5200 / 1710n
        if @body =~ /<[TITLE|title]*>Dell Laser Printer [A-Z]*[\d]{4}[a-z]*<\/[TITLE|title]*>/
                version=@body.scan(/<[TITLE|title]*>Dell Laser Printer ([A-Z]*[\d]{4}[a-z]*)<\/[TITLE|title]*>/)[0][0]
                m << {:version=>version }
        end

	# Tested model: 2330dn
        if @body =~ /<TITLE>Dell [\d]{4}[a-z]+ Laser Printer<\/TITLE>/
                version=@body.scan(/<TITLE>Dell ([\d]{4}[a-z]+) Laser Printer<\/TITLE>/)[0][0]
                m << {:version=>version }
        end

        m

end


end

