##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :probability

Plugin.define "HTTPServer" do
author "Andrew Horton"
version "0.2"
description "HTTP Server strings"
# identifying strings
#< Server: Apache/2.2.6 (Fedora)

def passive
	m=[]
	
	unless @meta.nil?
		server=nil	
		server=@meta["server"] if @meta.keys.include?("server")
	
		unless server.nil?		
			m << {:name=>"server string",:string=>server}
		end
	end
	
	m
end

end


