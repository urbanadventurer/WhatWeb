##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Localization" do
author "Aung Khant, http://yehg.net"
version "0.1"
description "Detect localization via xhtml and meta tag."

examples=%w|
www.github.com
joomla16.terraluna.nu
|	

#<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
#  <meta name="language" content="en-GB" />


def passive
	m=[]
	if @body =~ /xml\:lang="[\.\_a-zA-Z\-]+"/
		lan=@body.scan(/xml\:lang="([\.\_a-zA-Z\-]+)"/)[0]
		m << {:name=>"xml:lang",:string=>lan} 
	end	

	if @body =~ /lang="[\.\_a-zA-Z\-]+"/
		lan=@body.scan(/lang="([\.\_a-zA-Z\-]+)"/)[0]
		m << {:name=>"lang",:string=>lan} 
	end	

	if @body =~ /<meta name="language" content="[\.\_a-zA-Z\-]+" \/>/
		lan=@body.scan(/<meta name="language" content="([\.\_a-zA-Z\-]+)" \/>/)[0]
		m << {:name=>"meta tag",:string=>lan} 
	end	
	m
end

end



