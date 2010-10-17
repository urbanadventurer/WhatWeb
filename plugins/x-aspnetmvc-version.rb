##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


Plugin.define "X-ASPNetMvc-Version" do
author "Aung Khant <http://yehg.net>"
version "0.1"
description "HTTP header, x-aspnetmvc-version"

examples=%w|
gymbox.co.uk
playnextlevel.com
rabotadoma-perm.ru
howlingsword.co.kr
|
def passive
	m=[]
	
	unless @meta.nil?
		serverkey= %w|x-aspnetmvc-version X-AspNetMvc-Version|.map {|x| x if @meta.keys.include?(x) }.compact.first
		
		unless serverkey.nil?
			m << {:name=>"x-aspnetmvc-version string",:version=>@meta[serverkey]}
		end
	end
	m
end

end


