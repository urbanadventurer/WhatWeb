##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SmarterStats" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Complete SEO and Web Analytics for Individuals and Enterprises"
website "http://www.smartertools.com/smarterstats/web-analytics-seo-software.aspx"

# Google results as at 2011-03-13 #
# 87 for intitle:"Login - SmarterStats" "Login to SmarterStats"



# Matches #
matches [

# Product Detection # Vendor Link # >= 5.x
{ :string=>/<a href='http:\/\/www.smartertools.com\/smarterstats\/web-analytics-seo-software.aspx' target='_blank'>SmarterStats (Enterprise|Professional|Free) ([\d\.]+)<\/a>( |&nbsp;)\|( |&nbsp;)<a href='http:\/\/www.smartertools.com\/smarterstats\/web-analytics-seo-software.aspx' target='_blank'>Web Log Analytics( & SEO Software)?<\/a>/ },

# Verson Detection # Vendor Link # >= 5.x
{ :version=>/<a href='http:\/\/www.smartertools.com\/smarterstats\/web-analytics-seo-software.aspx' target='_blank'>SmarterStats (Enterprise|Professional|Free) ([\d\.]+)<\/a>( |&nbsp;)\|( |&nbsp;)<a href='http:\/\/www.smartertools.com\/smarterstats\/web-analytics-seo-software.aspx' target='_blank'>Web Log Analytics( & SEO Software)?<\/a>/, :offset=>1 },

# Product Detection # Vendor Link # 4.x
{ :string=>/<a href='http:\/\/www.smartertools.com\/Products\/SmarterStats\/Overview.aspx' target='_blank'>SmarterStats (Enterprise|Professional|Free) ([\d\.]+)<\/a>&nbsp;\|&nbsp;<a href='http:\/\/www.smartertools.com\/' target='_blank'>Windows Web Analytics<\/a>/ },

# Verson Detection # Vendor Link # 4.x
{ :version=>/<a href='http:\/\/www.smartertools.com\/Products\/SmarterStats\/Overview.aspx' target='_blank'>SmarterStats (Enterprise|Professional|Free) ([\d\.]+)<\/a>&nbsp;\|&nbsp;<a href='http:\/\/www.smartertools.com\/' target='_blank'>Windows Web Analytics<\/a>/, :offset=>1 },

# Product Detection # td bar1inner # 3.x
{ :string=>/										<td class=bar1inner>SmarterStats (Enterprise|Professional|Free|FREE) Edition ([\d\.]+)<\/td>/ },

# Version Detection # td bar1inner # 3.x
{ :version=>/										<td class=bar1inner>SmarterStats (Enterprise|Professional|Free|FREE) Edition ([\d\.]+)<\/td>/, :offset=>1 },

# Title
{ :text=>"<title>Login - SmarterStats</title>" },

]

end


