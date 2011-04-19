##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "qTranslate" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-19
version "0.1"
description "qTranslate Wordpress plugin - qTranslate makes creation of multilingual content as easy as working with a single language. - Homepage: http://www.qianqin.de/qtranslate/"

# ShodanHQ results as at 2011-04-19 #
# 820 for qtrans_cookie_test

# Examples #
examples %w|
194.245.151.44
213.160.140.102
94.23.117.179
86.121.209.10
69.93.8.221
217.23.10.101
72.167.244.210
178.33.3.75
67.20.77.89
91.121.226.169
|

# Passive #
def passive
	m=[]

	# Cookie # qtrans_cookie_test=qTranslate+Cookie+Test;
	if @meta['set-cookie'] =~ /qtrans_cookie_test=qTranslate\+Cookie\+Test;/

		m << { :name=>"qtrans_cookie_test cookie", :string=>"Wordpress" }

	end

	# Return passive matches
	m
end

end


