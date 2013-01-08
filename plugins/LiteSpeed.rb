##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LiteSpeed" do
  author "Sagar Prakash Junnarkar  <sagarjunnu@gmail.com>" # 2012-11-09" 
  version "1.0"
  description "LiteSpeed web server, which is able to read Apache configuration directly and used together with web hosting control panels by replacing Apache"
# Examples #
examples %w|
http://metrolyrics.com
http://dailycaller.com
http://howtogeek.com
http://fanfiction.net
http://myonlinearcade.com
http://slashgear.com
http://lalate.com
http://drivermanager.com
http://trekmedia.net
http://mydailymoment.com
|
	def passive
		m=[]
		m << {:name=>"LiteSpeed server" } if @headers["server"] =~ /LiteSpeed/i
		m
	end
end