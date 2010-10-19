##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2 by Andrew Horton
# Removed unneeded code, fixed bugs and simplified

Plugin.define "X-ASPNetMvc-Version" do
author "Aung Khant <http://yehg.net>"
version "0.2"
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


