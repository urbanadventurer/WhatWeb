##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100

Plugin.define "WordPressSpamFree" do
author "Andrew Horton"
version "0.2"
description "Wordpress SpamFree module."

# identifying strings
# <!-- Protected by WP-SpamFree v1.9.6.6 :: JS BEGIN -->

def passive
	m=[]
	
	if @body =~ /<!-- Protected by WP-SpamFree v[0-9\.]+ :: JS BEGIN -->/	
		match=true
		v=@body.scan(/<!-- Protected by (WP-SpamFree) v([0-9\.]+) :: JS BEGIN -->/)[0][1]
		m << {:name=>"html comments", :version=>v} 
	end

	m
end

end
