##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-02-21 # Brendan Coles <bcoles@gmail.com>
# Added OS detection
##
# Version 0.2
# removed :probability
##
Plugin.define "HTTPServer" do
author "Andrew Horton"
version "0.3"
description "HTTP server header string"

# Passive #
def passive
	m=[]
	
	unless @meta["server"].nil?

		# OS Detection # Windows family
		m << { :os=>"Windows (32 bit)" } if @meta["server"] =~ /Win32/i
		if @meta["server"] =~ /Windows/i
			m << { :os=>"Windows Vista" } if @meta["server"] =~ /Windows Vista/i
			m << { :os=>@meta["server"].scan(/Windows ([0-9]{4})/i) } if @meta["server"] =~ /Windows ([0-9]{4})/i
			m << { :os=>@meta["server"].scan(/Windows (Server [0-9]{4})/i) } if @meta["server"] =~ /Windows (Server [0-9]{4})/i
			m << { :os=>"Windows XP" } if @meta["server"] =~ /Windows XP/i
			m << { :os=>"Windows" } if m.empty?
		end
	
		# OS Detection # Unix family
		m << { :os=>"Unix" } if @meta["server"] =~ /UNIX/i
		m << { :os=>"FreeBSD" } if @meta["server"] =~ /FreeBSD/i
		m << { :os=>"Solaris" } if @meta["server"] =~ /Solaris/i
		m << { :os=>"MacOSX" } if @meta["server"] =~ /MacOSX/i
		m << { :os=>"CentOS" } if @meta["server"] =~ /CentOS/i
		m << { :os=>"Debian Linux" } if @meta["server"] =~ /Debian/i
		m << { :os=>"Ubuntu Linux" } if @meta["server"] =~ /Ubuntu/i
		m << { :os=>"Mandrake Linux" } if @meta["server"] =~ /Mandrake/i
		m << { :os=>"PCLinuxOS" } if @meta["server"] =~ /PCLinuxOS/i
		m << { :os=>"Fedora Linux" } if @meta["server"] =~ /Fedora/i
		m << { :os=>"openSUSE" } if @meta["server"] =~ /openSUSE/i
		m << { :os=>"Arch Linux" } if @meta["server"] =~ /Arch Linux/i
		m << { :os=>"Mandriva Linux" } if @meta["server"] =~ /Mandriva Linux/i
		m << { :os=>"SUSE Linux" } if @meta["server"] =~ /Linux\/SUSE/i
		m << { :os=>"Slackware Linux" } if @meta["poweredby"] =~ /Slackware/i
		m << { :os=>"Gentoo Linux" } if @meta["x-powered-by"] =~ /Gentoo/i
		m << { :os=>"Red Hat Linux" } if @meta["server"] =~ /Red[-| ]?Hat/i
		m << { :os=>"Linux" } if m.empty? and @meta["server"] =~ /Linux/i

		# Return server string
		m << {:name=>"server string",:string=>@meta['server'].to_s}

	end

	# Return passive matches
	m
end

end

