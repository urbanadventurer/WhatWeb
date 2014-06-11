##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DirectAdmin" do
author "Brendan Coles <bcoles@gmail.com>" # 201-04-22
version "0.1"
description "Control panel for web hosting companies running Red Hat 7.x, 8.x, 9.x, Red Hat Enterprise and FreeBSD. - Homepage: http://www.directadmin.com/"

# 24 for intitle:"DirectAdmin Login" "DirectAdmin Login Page" "Please enter your Username and Password"

# Dorks #
dorks [
'intitle:"DirectAdmin Login" "DirectAdmin Login Page" "Please enter your Username and Password"'
]



# Matches #
matches [

{ :text=>'<td class=listtitle colspan=2>Please enter your Username and Password</td></tr>' },

{ :text=>'<title>DirectAdmin Login</title>' },

{ :text=>'*{ FONT-SIZE: 8pt; FONT-FAMILY: verdana; } b { FONT-WEIGHT: bold; } .listtitle { BACKGROUND: #425984; COLOR: #EEEEEE; white-space: nowrap; } td.list { BACKGROUND: #EEEEEE; white-space: nowrap; } </style>' },

{ :text=>"onload=\"document.form.username.focus();if(document.form.referer.value.indexOf('#')==-1)document.form.referer.value+=location.hash;\">" },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^DirectAdmin Daemon v([^\s]+) Registered to /) } if @headers["server"] =~ /^DirectAdmin Daemon v([^\s]+) Registered to /

	# Return passive matches
	m
end

end


