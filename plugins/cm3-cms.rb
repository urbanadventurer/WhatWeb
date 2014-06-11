##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "cm3-cms" do
author "Aung Khant <http://yehg.net/>" # 2012-02-12
version "0.1"
description "CM3/CM2 CMS - http://www.cm3cms.com/ , CM2 was based on ASP, CM3 was based on ASP.NET."



# Matches #
matches [
{:name=>'JavaScript Object (CM2)',:text=>'top.cm2_home.location.href'},
{:name=>'HTML Body (CM2)',:text=>'name="cm2_top" id="cm2_top"'},
{:name=>'HTML Body (CM2)',:text=>'name="cm25_main"'},
{:name=>'HTML Body (CM3)',:text=>'name="id="cm3top" name="cm3top"'},
{:name=>'HTML Body (CM3)',:text=>'logo_cm3_top.gif" border="0"'},
{:name=>'HTML Body (CM3)',:text=>'alt="Content management system: cm3 built and powered"'},
{:name=>'HTML Body (CM3)',:text=>'cm3powered_green.gif"'},
{:name=>'Set-Cookie Header (CM3)', :search=>"headers[set-cookie]", :regexp=>/cm3session/}

]

# Aggressive #
def aggressive
	m=[]
	# cm2
	target = URI.join(@base_uri.to_s,'admin/').to_s	
	status,url,ip,body,headers=open_target(target)	
	if status == 200

		if body =~ /(name="cm2_top" id="cm2_top"|name="cm25_main")/
			m << {:name => "HTML Body (CM2)"}
		end

	end
	# cm3
	target = URI.join(@base_uri.to_s,'AcoraCMS/Admin/').to_s	
	status,url,ip,body,headers=open_target(target)	
	if status == 200

		if headers["set-cookie"] =~ /cm3session/
			m << {:name => "HTTP Cookie (CM3)"}
		end

	end	
	m
end

end
