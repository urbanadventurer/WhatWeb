##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "QuesCom-Qportal" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "Qportal web interface for QuesCom telephony devices"
website "http://www.quescom.com/products.asp"

# ShodanHQ results as at 2011-05-30 #
# 842 for OctoWebSvr



# Matches #
matches [

# head profile="http://www.quescom.com"
{ :text=>'<head profile="http://www.quescom.com">' },

# Frameset # src="/cticall/cticall_close.asp"
{ :url=>"/userframes.asp", :text=>'<FRAME src="/cticall/cticall_close.asp" name="cticlose" frameborder="no" scrolling="no" marginwidth="0" marginheight="0">' },

# Stylesheet
{ :text=>'<link href="/qpuser.css" rel="stylesheet" type="text/css">' },

# Aggressive # /Oem/topright.gif
{ :url=>"/Oem/topright.gif", :md5=>"8ddc6366869cf61044d7bc4b21ca1b1e" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^OctoWebSvr\/COM$/
		m << { :name=>"HTTP Server Header" }
	end

	# Return passive matches
	m
end

end

