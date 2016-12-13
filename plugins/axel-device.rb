##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Axel-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-20
version "0.1"
description "Axel design and manufacture innovative TCP/IP based Thin Client Terminals and Office Servers for Windows, Unix/Linux and AS/400 environments. Axel products are unique in having no embedded operating system."
website "http://www.axel.com/"

# ShodanHQ results as at 2011-05-20 #
# 28 for Axel Admin Server

# Google results as at 2011-05-20 #
# 1 for "Syntax Error or Not Axel XML data"

# Dorks #
dorks [
'"Syntax Error or Not Axel XML data"'
]



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Axel Admin Server$/

		m << { :name=>"HTTP Server Header" }

		if @body =~ /^<AxelAdmin>$/

			# Server Name
			m << { :string=>@body.scan(/^<Name>([^\s^<]+)<\/Name>$/) } if @body =~ /^<Name>([^\s^<]+)<\/Name>$/

			# Firmware Version Detection
			m << { :firmware=>@body.scan(/^<Version>([^\s^<]+)<\/Version>$/) } if @body =~ /^<Version>([^\s^<]+)<\/Version>$/

		end

	end

	# Return passive matches
	m
end

end

=begin
The AX3000 hardware information is in the form of FKx-BVyyy

    FKx is the electronic board code (click here for more information)
    BVyyy is the boot code version (the boot code is the non-erasable part of the flash memory) 

More info: http://www.axel.com/faq/faq_axtcp_e.html
=end

