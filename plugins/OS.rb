##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # Brendan Coles <bcoles@gmail.com>
# Added HTTP Server Header catch all
##
Plugin.define "OS" do
author "Aung Khant, http://yehg.net"
version "0.2"
description "This plugin attempts to identify the Operation System using the HTTP packet header."

examples %w|
http://imagehotel.net
http://decksen.com
http://180.92.173.202
http://www.freehostia.com
http://58.68.32.34/
http://orbitscripts.com
http://byet.org
http://mojawyspa.co.uk
http://www.productpilot.com/
http://www.westword.com
http://lanzend.co.nz
http://www.microsoft.com
http://www.asp.net
http://www.apple.com
http://ww.test.com
http://216.200.40.179
http://216.83.191.232
http://12.237.96.129
http://64.71.182.100
http://64.71.181.79
http://12.237.96.130
http://219.166.162.171
http://219.87.157.22/
http://89.137.17.241
http://62.4.73.165
http://62.92.43.234
http://89.137.17.241
http://92.70.4.235
http://64.71.181.95/
http://63.173.251.26/
http://202.3.136.54/
http://202.3.136.51/
|

# Passive #
def passive
	m=[]

	# ASP.NET
	m << {:string=>'Windows'} if @meta['server'] =~ /microsoft|asp\.net/i
	m << {:string=>'Windows'} if @meta['x-powered-by'] =~ /asp\.net/

	# Servlet-Engine # http://www.shodanhq.com/?q=IBM+Corporation
	# Servlet-Engine: Tomcat Web Server/3.2.4 (JSP 1.1; Servlet 2.2; Java 1.3.0; Linux 2.4.2-SGI_XFS_1.0smp x86; java.vendor=IBM Corporation) 
	m << { :string=>@meta['servlet-engine'].scan(/\((.*?); java.vendor=IBM Corporation\)/) } if @meta['servlet-engine'] =~ /\((.*?); (.*?); (.*?); (.*?); java.vendor=IBM Corporation\)/

	# HTTP Server Header # Catch-All
	if m.size == 0

		# Windows family
		m << { :string=>"Windows (32 bit)" } if @meta["server"] =~ /Win32/i
		m << { :string=>"Windows" } if @meta["server"] =~ /Windows/i
		m << { :string=>"Windows Vista" } if @meta["server"] =~ /Windows Vista/i
		m << { :string=>@meta["server"].scan(/Windows ([0-9]{4})/i) } if @meta["server"] =~ /Windows ([0-9]{4})/i
		m << { :string=>@meta["server"].scan(/Windows Server ([0-9]{4})/i) } if @meta["server"] =~ /Windows Server ([0-9]{4})/i
		m << { :string=>"Windows XP" } if @meta["server"] =~ /Windows XP/i
		# Unix family
		m << { :string=>"Linux" } if @meta["server"] =~ /Linux/i
		m << { :string=>"Unix" } if @meta["server"] =~ /UNIX/i
		m << { :string=>"FreeBSD" } if @meta["server"] =~ /FreeBSD/i
		m << { :string=>"Solaris" } if @meta["server"] =~ /Solaris/i
		m << { :string=>"MacOSX" } if @meta["server"] =~ /MacOSX/i
		m << { :string=>"CentOS" } if @meta["server"] =~ /CentOS/i
		m << { :string=>"Debian Linux" } if @meta["server"] =~ /Debian/i
		m << { :string=>"Ubuntu Linux" } if @meta["server"] =~ /Ubuntu/i
		m << { :string=>"Mandrake Linux" } if @meta["server"] =~ /Mandrake/i
		m << { :string=>"PCLinuxOS" } if @meta["server"] =~ /PCLinuxOS/i
		m << { :string=>"Fedora Linux" } if @meta["server"] =~ /Fedora/i
		m << { :string=>"openSUSE" } if @meta["server"] =~ /openSUSE/i
		m << { :string=>"Arch Linux" } if @meta["server"] =~ /Arch Linux/i
		m << { :string=>"Mandriva Linux" } if @meta["server"] =~ /Mandriva Linux/i
		m << { :string=>"SUSE Linux" } if @meta["server"] =~ /Linux\/SUSE/i
		m << { :string=>"Slackware Linux" } if @meta["poweredby"] =~ /Slackware/i
		m << { :string=>"Gentoo Linux" } if @meta["x-powered-by"] =~ /Gentoo/i
		m << { :string=>"Red Hat Linux" } if @meta["server"] =~ /Red Hat/i
		m << { :string=>"Red-Hat Linux" } if @meta["server"] =~ /Red-Hat/i
	end

	m

end

end


