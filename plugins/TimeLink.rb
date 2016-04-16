##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TimeLink" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-01
version "0.1"
description "Full-featured web-based Time and Attendance, Workforce Scheduling, Leave Management and Labor Activity software"
website "http://www.timelink.com/productsbyproducts.html"

# Google results as at 2011-06-01 #
# 4 for intitle:Timelink +Language +Password +Version -ext:html
# 3 for inurl:"timelink/login" +version

# Dorks #
dorks [
'intitle:Timelink "Language" "Password" "Version" -ext:html'
]



# Matches #
matches [

# Version Detection # Copyright footer
{ :version=>/<p>Version ([\d\.]+)&nbsp;&copy; 2003 - 20[\d]{2} Time ?Link International Corp\. All Rights Reserved\.<\/p>/ },

# shortcut icon HTML
{ :text=>'<link rel="shortcut icon" type="image/png" href="/timelink/images/favicon.ico"/>' },

# Aggressive # Enterprise 6.x # images/login-panel-back.png
{ :url=>"images/login-panel-back.png", :md5=>"37897a66217e910dd6c67f1d09c5e870", :version=>"6.x", :string=>"Enterprise" },

]

# Passive #
def passive
	m=[]

	# Title
	if @body =~ /<title>Timelink<\/title>/

		# Model Detection
		m << { :model=>@body.scan(/<td><div class="heading">([A-Z]+)<font class="titlefont">([^<]+)<\/font><\/div><\/td>/).flatten } if @body =~ /<td><div class="heading">([A-Z]+)<font class="titlefont">([^<]+)<\/font><\/div><\/td>/

	end

	# Return passive matches
	m
end

end

