##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WampServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "WampServer is a Windows web development environment. It allows you to create web applications with Apache, PHP and the MySQL database. It also comes with PHPMyAdmin to easily manage your databases."
website "http://www.wampserver.com/"

# Google results as at 2011-03-16 #
# 53 for "Server Configuration" intitle:"WAMPSERVER Homepage"



# Passive #
def passive
	m=[]

	# Title and h1 heading
	if @body =~ /<h1><abbr title="Windows">W<\/abbr><abbr title="Apache">A<\/abbr><abbr title="MySQL">M<\/abbr><abbr title="PHP">P<\/abbr><\/h1>/ and @body =~ /<title>WAMPSERVER Homepage<\/title>/

		m << { :name=>"Title and h1 heading" }

		# Version Detection
		m << { :version=>@body.scan(/<ul class="utility">[\s]*<li>Version ([\d\.]+)[\s]*<\/li>/) } if @body =~ /<ul class="utility">[\s]*<li>Version ([\d\.]+)[\s]*<\/li>/

	end

	# Return passive matches
	m
end
end


