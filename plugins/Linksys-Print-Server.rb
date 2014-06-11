##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Linksys-Print-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.1"
description "Linksys Print Server - Print servers connect printers directly to the network so that multiple PCs can share them. - Homepage: http://homesupport.cisco.com/en-us/wireless/lbc/PSUS4/download"

# ShodanHQ results as at 2011-03-07 #
# 1,142 for PRINT_SERVER WEB
# 1,142 for PRINT_SERVER WEB 1.0



# Matches #
matches [

# Model Detection
{ :text=>'<td align="right" class="pname" height="25" colspan="5">Print Server for USB with 4-Port Switch &nbsp; &nbsp; </td>', :model=>"PSUS4" },

# Firmware Version Detection
{ :firmware=>/<td width="585" colspan="2" bgcolor="#6666CC" valign="bottom" align="right"><span class="fwversion">Firmware Version: &nbsp; ([^\s]{1,10}) <\/span> &nbsp;&nbsp;<\/td>/ },

]

# Passive #
def passive
	m=[]

	# Server: PRINT_SERVER WEB # Also used by other printer servers
	m << { :certainty=>25, :version=>@headers["server"].scan(/^PRINT_SERVER WEB ([\d\.]+)$/) } if @headers["server"] =~ /^PRINT_SERVER WEB ([\d\.]+)$/

	# Return passive matches
	m
end

end


