##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100

Plugin.define "X-ASPNetVersion" do
author "Andrew Horton"
version "0.2"
description "HTTP header, x-aspnet-version"

def passive
	m=[]
	
	unless @meta.nil?
		serverkey= %w|x-aspnet-version X-AspNet-Version|.map {|x| x if @meta.keys.include?(x) }.compact.first
		
		unless serverkey.nil?
			m << {:name=>"x-aspnet-version string",:version=>@meta[serverkey]}
		end
	end
	m
end

end


