##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "CodeIgniterProfiler"
authors [
  "Caleb Anderson",
]
version "0.1"
description "Find codeigniter profiler debug divs"




passive do
	m=[]
	if @body =~ /URI STRING/ and @body =~ /Total Execution Time/ and @body =~ /Controller Execution Time/ and @body =~ /Loading Time Base Classes/
		m << {:name=>'Found 4 strings'}
	end
	m
end

end


