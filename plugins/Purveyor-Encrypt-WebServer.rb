##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Purveyor-Encrypt-WebServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-21
version "0.2"
description "Purveyor Encrypt WebServer for OpenVMS combines the reliability, security and scalability of the OpenVMS platform with the graphical ease-of-use and functionality of World Wide Web technologies. OpenVMS (Open Virtual Memory System), previously known as VAX-11/VMS, VAX/VMS or (informally) VMS, is a high-end computer server operating system that runs on VAX, Alpha and Itanium-based families of computers. - More info: http://www.sss.co.nz/software/purveyor/purvpage.htm"
# More info:
# http://www.openvms.org/
# http://alpha.mike-r.com/VMS_beginners_faq.html
# http://en.wikipedia.org/wiki/OpenVMS

# ShodanHQ results as at 2011-05-21 #
# 18 for Purveyor Encrypt Domestic
# 10 for Purveyor Encrypt Export

matches [

	# HTTP Server Header
	{  :os=>"OpenVMS", :regexp=>/^Purveyor Encrypt/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{  :os=>"OpenVMS", :version=>/^Purveyor Encrypt (Export|Domestic)\/v([^\s]+) OpenVMS$/, :offset=>1, :search=>"headers[server]" },

]

end

