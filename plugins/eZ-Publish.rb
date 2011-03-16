##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eZ-Publish" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "eZ Publish is an Open Source Content Management System chosen by thousands of enterprises and organizations world wide. - Homepage: http://ez.no/"

# ShodanHQ results as at 2011-03-17 #
# 1,716 for X-Powered-By: eZ Publish

# Google results as at 2011-03-17 #
# 58 for Admin intitle:"eZ publish administration"

# Examples #
examples %w|
admin.rfidjournal.com
admin.osservatoriobalcani.org
admin.www.andersen-larsen.dk
admin.liberali.ezpublish.no
admin.europass-info.at
admin.respekt.dgb.de
admin.linmag.no
admin.rollingpin.at
admin.www.oneworld.net
admin.www.uk.oneworld.net
admin.europass-info.at
admin.respekt.dgb.de
admin.karimetalli.fi
admin.linmag.no
admin.rollingpin.at
81.20.77.143
195.205.97.208
213.192.79.69
216.194.225.57
202.218.211.76
160.92.182.51
82.165.149.67
150.186.96.64
203.98.92.241
70.84.64.55
|

# Matches #
matches [

# Admin # Title
{ :text=>'<title>eZ publish administration</title>' },

# Admin # CSS
{ :text=>'<link rel="stylesheet" type="text/css" href="/admin/templates/ezpublish/style.css" />' },

# Admin # body
{ :text=>"topmargin=\"6\" marginheight=\"6\" leftmargin=\"6\" marginwidth=\"6\" onload=\"MM_preloadImages('/admin/images/ezpublish/redigerminimrk.gif','/admin/images/ezpublish/slettminimrk.gif','/admin/images/ezpublish/downloadminimrk.gif')\">" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["x-powered-by"] =~ /^eZ [p|P]ublish/

	# Return passive matches
	m
end

end


