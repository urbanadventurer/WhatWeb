##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated firmware version detection.
# Added model detection.
##
Plugin.define "Linksys-USB-HDD" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-27
version "0.2"
description "Linksys external USB HDD web frontend - homepage: http://www.linksys.com/"

# 7 results for intitle:"Network Storage Link for USB 2.0 Disks" Firmware @ 2010-06-27
examples %w|
94.224.183.90:8080
82.90.216.198
193.206.101.3
kinsella.dnsalias.org
|

matches [

# GHDB Match
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1382
{ :ghdb=>'intitle:"Network Storage Link for USB 2.0 Disks" Firmware', :certainty=>75 },

# Default title
{ :text=>'<title>Network Storage Link for USB 2.0 Disks</title>' },

]

# Extract model and firmware
def passive
        m=[]

	# Firmware
        if @body =~ /          Version: &nbsp;V[\d\.\-a-zA-Z]+<\/span> &nbsp;&nbsp;<\/td>/
                firmware=@body.scan(/          Version: &nbsp;V([\d\.\-a-zA-Z]+)<\/span> &nbsp;&nbsp;<\/td>/)
                m << { :firmware=>firmware }
        end

	# Model
	if @body =~ /	 <td align="center" width="100" class="mname">([^<]+)<\/td>/
		model=@body.scan(/	 <td align="center" width="100" class="mname">([^<]+)<\/td>/)
		m << { :model=>model }
	end

        m

end


end

