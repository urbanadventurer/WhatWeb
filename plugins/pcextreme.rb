##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "pcextreme" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.1"
description "pcextreme server"
website "http://www.pcextreme.nl/"

# ShodanHQ results as at 2011-03-07 #
# 17 for Server PCX -PCX3000 -apache -IIS
# All results are from Netherlands



# Matches #
matches [

# Header Image
{ :url=>"/img/header_normal.png", :md5=>"f6803df276fd181667f3e6975b12b3dc" },

# This server is owned by text
{ :text=>'<p class="content" align="center">Deze server is eigendom van <a href="http://www.pcextreme.nl/">PCextreme B.V.</a></p>' },

]

# Passive #
def passive
	m=[]

	# HTP Server Header
	if @headers["server"] =~ /^PCX\/(No-Cache|Dynamic)/

		# Server: PCX/No-Cache # Server: PCX/Dynamic
		m << { :name=>"HTTP Server Header" }

		# PHP Version Detection
		m << { :string=>"PHP:"+@body.scan(/<td class="content">([^\s]+) \(<a href=".\/phpinfo.php" target="_blank">phpinfo<\/a>\)<\/td>/).flatten } if @body =~ /<td class="content">([^\s]+) \(<a href=".\/phpinfo.php" target="_blank">phpinfo<\/a>\)<\/td>/

	end

	# Return passive matches
	m
end

end


