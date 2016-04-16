##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Nette-Framework" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "Nette Framework is a powerful framework for rapid and easy creation of high quality and innovative web applications in PHP 5.3"
website "http://nette.org/cs/"

# ShodanHQ results as at 2011-04-08 #
# 105 for X-Powered-By: Nette Framework



# Passive #
def passive
	m=[]

	# X-Powered-By Header
	m << { :name=>"X-Powered-By" } if @headers["x-powered-by"] =~ /^Nette Framework$/

	# Return passive matches
	m

end

end

