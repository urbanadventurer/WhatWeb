##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EMS-ENTRY-COM" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "EMS-ENTRY-COM is database software that gathers data from Beckmann Zent5 main control panels and payment systems and makes them available as an SQL database. The retrieved data are analysed, reviewed and subsequently transformed into a relational database. - Homepage: http://www.beckmann-gmbh.de/en/products/pc_software/ems_entry_com"

# ShodanHQ results as at 2011-03-14 #
# 65 for Beckmann-GmbH

# Examples #
examples %w|
193.213.42.43
193.213.21.152
193.213.31.77
193.213.21.179
85.196.126.122
193.212.77.222
62.92.92.2
85.196.68.174
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^(EMS-Entry|ZENT5) V[\d\.]+ Beckmann-GmbH$/

		m << { :name=>"HTTP Server Header" }

		# Version Detection
		m << { :version=>@body.scan(/<td width="20%" valign="top" align="right">Application-Version:<br>Ver ([\d\.]+) [\d]{2}\.[\d]{2}.[\d]{4}<\/td>/) } if @body =~ /<td width="20%" valign="top" align="right">Application-Version:<br>Ver ([\d\.]+) [\d]{2}\.[\d]{2}.[\d]{4}<\/td>/

	end

	# Return passive matches
	m
end

end


