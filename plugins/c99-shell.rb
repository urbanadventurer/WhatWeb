##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "c99-Shell" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-08
version "0.1"
description "c99 PHP Backdoor"

# Google results as at 2010-10-08 #
# 272 for inurl:c99.php ext:php
# 117 for inurl:c99.php ext:php +uname



matches [

# Form HTML # Identifies both c99 source and working c99 shells
{ :text=>'Dir: <input type="text" name="directory" method="get"> <input type="submit" value="List Directory"><br><br> eg: /etc/<br>' },
{ :text=>'<center>Php Safe-Mode Bypass (List Directories):     <form action="' },

]

# Passive #
def passive
        m=[]

	# Get local file path # Must start with "/" to avoid c99 source
	if @body =~ /<input type=hidden name=act value="cmd"><input type=hidden name="d" value="\//
		m << { :filepath=>@body.scan(/<input type=hidden name=act value="cmd"><input type=hidden name="d" value="([^\"]+)/) } if @body =~ /<input type=hidden name=act value="cmd"><input type=hidden name="d" value="([^\"]+)/
	end

	# Return passive matches
	m
end

end

