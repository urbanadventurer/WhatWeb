##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


Plugin.define "RSSFeed" do
author "Caleb Anderson"
version "0.1"
description "rss feed detection"

examples %w|adrianlamologs.blogspot.com www.wired.com|

matches [
{:name=>"rss link type",
:regexp=>/<link .*?type=["']application\/rss\+xml["'].*?>/im
} #'
]

def passive
	#link=@body.scan(/<link .*?type=["']application\/rss\+xml["'].*?>/im).first
	re=/<link .*?type=["']application\/rss\+xml["'].*?>/im #'
	if @body =~ re
		link=@body.scan(re).first
		url=link.scan(/href=["'](.*?)["']/i).first.first rescue nil
	end
   
    	return [{:name=>"rss link",:string=>url}] unless url.nil?
    	return []
end


end


