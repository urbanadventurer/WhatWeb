##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ExpressionEngine"
authors [
  "Andrew Horton",
  # v0.2 # removed :name and :certainty=>100. 
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # v0.3 # 2016-08-19 # Removed passive block. Added 3 new cookies. 
]
version "0.2"
description "ExpressionEngine is CMS written in PHP. Free and commercial versions."
website "http://expressionengine.com"

# Dorks #
dorks [
'"Powered by ExpressionEngine"'
]

#Powered by <a href="http://expressionengine.com/">ExpressionEngine</a>   uncommon

matches [

	{:regexp=>/owered by <a href="http:\/\/expressionengine.com\/">ExpressionEngine<\/a>/},

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^exp_last_visit/, :name=>"exp_last_visit cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^exp_last_activity/, :name=>"exp_last_activity cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^exp_tracker/, :name=>"exp_tracker cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^exp_csrf_token/, :name=>"exp_csrf_token cookie" },

]

#Set-Cookie: exp_last_visit=959242411; expires=Mon, 23-May-2011 03:13:31 GMT; path=/
#Set-Cookie: exp_last_activity=1274602411; expires=Mon, 23-May-2011 03:13:31 GMT; path=/
#Set-Cookie: exp_tracker=a%3A1%3A%7Bi%3A0%3Bs%3A5%3A%22index%22%3B%7D; path=/


# these plugins only identify the system. they don't find out the version, etc
aggressive do
	m=[]
	
	target = URI.join(@base_uri.to_s,"READ_THIS_FIRST.txt").to_s
	status,url,ip,body,headers=open_target(target)
	
	if body =~ /ExpressionEngine/
		m << {:name=>"readthisfirst txt file" }
	end

	target = URI.join(@base_uri.to_s,"system/updates/ee_logo.jpg").to_s
	status,url,ip,body,headers=open_target(target)
	
	if status == 200 and body =~ /JFIF/
		m << {:name=>"ee_logo jpg" }
	end
		
	m
end

end


