##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WWW-File-Share-Pro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-20
version "0.1"
description "WWW File Share Pro - Share all kinds of files on the internet or on your intranet with this handy software."
website "http://www.wfshome.com/"

# ShodanHQ results as at 2011-04-20 #
# 203 for WWW File Share Pro

# Google results as at 2011-04-20 #
# 41 for "Powered by LionMax Software" intitle:"WWW File Share" -allintext

# Dorks #
dorks [
'"Powered by LionMax Software" intitle:"WWW File Share" -allintext'
]



# Matches #
matches [

# Powered by link
{ :text=>'<td height="27"><a href="http://www.lionmax.com" target="_blank">Powered by LionMax Software</a></td>' },

]

# Passive #
def passive
	m=[]

	# HTTP Server header
	m << { :name=>"HTTP Server header" } if @headers["server"] =~ /^WWW File Share Pro$/

	# Return passive matches
	m
end

end


