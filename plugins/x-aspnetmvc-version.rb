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
			
	if @meta.keys.include?("x-aspnetmvc-version")
		m << {:name=>"x-aspnetmvc-version string",:version=>@meta["x-aspnetmvc-version"]}
	end
	m
end

end


