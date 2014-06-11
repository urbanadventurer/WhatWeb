##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IBM-CICS-Transaction-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-22
version "0.1"
description "IBM Customer Information Control System is the new face of CICS Integration point for CICS tooling with rich CICS views, data, and methods. CICS Transaction Server for z/OS is a modern, dependable, and cost effective application platform. z/OS is a 64-bit operating system for mainframe computers, produced by IBM. - Homepage:  http://www-01.ibm.com/software/htp/cics/tserver/v41/"

# More Info:
#  http://en.wikipedia.org/wiki/Z/OS
#  http://www-03.ibm.com/systems/z/os/zos/

# ShodanHQ results as at 2011-03-22 #
# 16 for IBM_CICS_Transaction_Server
# 16 for (zOS) IBM



# Passive #
def passive
	m=[]

	# Version and OS Detection # HTTP Server Header
	m << { :os=>"z/OS", :version=>@headers["server"].scan(/^IBM_CICS_Transaction_Server\/([^\(]+)\(zOS\)$/) } if @headers["server"] =~ /^IBM_CICS_Transaction_Server\/([^\(]+)\(zOS\)$/

	# Return passive matches
	m

end

end

