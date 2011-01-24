##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :probability
Plugin.define "Google-Analytics" do
author "Andrew Horton"
version "0.2"
description "web visitor statistics www.google-analytics.com"

def passive
	m=[]
	
	# detects google analytics urchin
	if @body =~ /<script src="http:\/\/www.google-analytics.com\/urchin.js" type="text\/javascript">/
		match=true
		
		result=@body.scan(/_uacct = "UA-([0-9]+)-[0-9]+";/)
		accounts = result.flatten if result
		m << {:name=>"urchin.js",:account=>accounts.sort.uniq, :string=>"urchin"}
	end
	
	# detects google analytics GA version
	# var pageTracker = _gat._getTracker("UA-791888-16");
	# var pageTracker = _gat._getTracker("UA-254153-1");
	
	if @body =~ /var pageTracker = _gat._getTracker\("UA-([0-9]+)-([0-9]+)"\);/
		result=@body.scan(/var pageTracker = _gat._getTracker\("UA-([0-9]+)-([0-9]+)"\);/)
		accounts = result.map {|x| x[0] }
		m << {:name=>"pageTracker = ...UA-123-1231", :string=>"GA",:account=>accounts.sort.uniq}
	end
	
	if @body =~ /window.google_analytics_uacct = "UA-[0-9]+-[0-9]+";/
		match=true
		result=@body.scan(/window.google_analytics_uacct = "UA-([0-9]+)-([0-9]+)";/)
		accounts = result.map {|x| x[0] }		
		m << {:name=>"window.google_analytics_uacct = UA-123-1231",:string=>"GA", :account=>accounts.sort.uniq}
	end
	
	m
end

end


