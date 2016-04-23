##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TutorTrac" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.1"
description "Online management software for learning, writing, tutoring departments, and academic skills centers for traditional and athletic students. "
website "http://www.go-redrock.com/"

# ShodanHQ results as at 2011-06-02 #
# 65 for TutorTrac

# Google results as at 2011-06-02 #
# 5 for intitle:"TutorTrac Learning Center Tracking Software"

# Dorks #
dorks [
'intitle:"TutorTrac Learning Center Tracking Software"'
]



# Matches #
matches [

# Title
{ :text=>'<TITLE>TutorTrac Learning Center Tracking Software</TITLE>' },

# Meta Keywords
{ :text=>'<meta name="keywords" content="tutor,software,scheduling,learning,center,tutoring,assistant,assistance,education,accutrack,tutorial,community,college,university"><meta name="description" content="Web Based Tutor/Learning Center Management/Scheduling Software">' },

# Version Detection # 3.x
{ :version=>/<P ALIGN=right><FONT SIZE="-1" FACE="Verdana" COLOR="#CCCCCC">version[\s]+([\d\.]+)[\s]?&copy;Copyright 20[\d]{2}, <\/FONT><A HREF="http:\/\/www\.go-redrock\.com"><FONT SIZE="-1" FACE="Verdana" COLOR="#CCCCCC">RedRock/ },

# Version Detection # 4.x
{ :version=>/<P ALIGN=right><FONT COLOR="#CCCCCC">version ([\d\.]+)[\s]+&copy;Copyright 2004-20[\d]{2}<br \/><\/FONT><A HREF="http:\/\/www\.go-redrock\.com"><FONT COLOR="#CCCCCC">RedRock/ },

# Aggressive # Usually 3.x # /TutorTrac/favicon.ico
{ :url=>"/TutorTrac/favicon.ico", :md5=>"c56dda95e69b50c4b3802919aab0e950" },

# Aggressive # Usually 4.x # /TracWeb40/favicon.ico
{ :url=>"/TracWeb40/favicon.ico", :md5=>"365ccabab0c04ec5c6a9721725b76c36" },

]

# Passive #
def passive
	m=[]

	# No server HTTP header
	if @headers["server"].nil?

		# Location Header # ./TracWeb40/Default.html
		m << { :name=>"Location Header" } if @headers["location"] =~ /^\.\/TracWeb40\/Default\.html$/

		# Location Header # TutorTrac/Default.html
		m << { :name=>"Location Header" } if @headers["location"] =~ /^TutorTrac\/Default\.html$/

		# InstallCode Cookie
		m << { :name=>"InstallCode Cookie" } if @headers["set-cookie"] =~ /InstallCode=[A-Z]+;/

		# ProductCode Cookie
		m << { :name=>"ProductCode Cookie" } if @headers["set-cookie"] =~ /ProductCode=RSC[\d]+=[\d]+;/

	end

	# Return passive matches
	m
end

end

