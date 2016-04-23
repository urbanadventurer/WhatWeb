##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SpinetiX-Hyper-Media-Player" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.1"
description "SpinetiX HMP100 is the first networked Hyper Media Player appliance dedicated to the professional digital signage industry. In this field it represents for final users, integrators and service providers a better alternative of choice to personal and industrial computers and proprietary dedicated software."
website "http://www.spinetix.com/hmp100"
# Product Brief: http://www.spinetix.com/files/productbriefs/SpinetiX_HMP100_ProductBrief.pdf

# About 23 ShodanHQ results for "X-spinetix-firmware" @ 2010-10-30
# Insecure: 5 ShodanHQ results for "X-spinetix-firmware" "200 OK" @ 2010-10-30


matches [

# Admin page # Default title
{ :regexp=>/<title>HMP100 #[0-9a-z]*: Status<\/title>/, :model=>"HMP100", :string=>"Admin" },

# Admin Page # Default h1 HTML
{ :text=>'<h1>SpinetiX HMP100 Web Access</h1></div>', :model=>"HMP100", :string=>"Admin" },

# Admin page # Default logo HTML
{ :text=>"<img src='images/device_hmp100.jpg' width='550' height='323' alt='SpinetiX HMP100' usemap='#advancedMap'/>", :model=>"HMP100", :string=>"Admin" },

# Admin page # Default favicon HTML
{ :text=>"<link rel='shortcut icon' href='css/ithemeSpinetix_favicon.ico' type='image/x-icon' />", :model=>"HMP100", :string=>"Admin" },

]

# Passive
def passive
	m=[]

	# HTTP Headers
	if @headers["x-spinetix-firmware"] =~ /^([^\r^\n]*)/ and @headers["x-raperca-version"] =~ /^([^\r^\n]*)/

		# X-spinetix-firmware
		m << { :firmware=>@headers["x-spinetix-firmware"].scan(/^([^\r^\n]*)/).flatten, :model=>"HMP100" }

		# X-raperca-version
		m << { :module=>"raperca/"+@headers["x-raperca-version"].scan(/^([^\r^\n]*)/).flatten, :model=>"HMP100" }

	end

	# Admin Page # Extract MAC
	if @body =~ /<h1>SpinetiX HMP100 Web Access<\/h1><\/div>/ and @body =~ /SpinetiX SA. All rights reserved.<br\/>/ and @body =~ /<tr><td>MAC : <\/td><td>([^<]+)<\/td>/
		m << { :account=>@body.scan(/<tr><td>MAC : <\/td><td>([^<]+)<\/td>/).flatten, :model=>"HMP100", :string=>"Admin" }
	end

	m

end

end

