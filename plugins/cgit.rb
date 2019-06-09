##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "cgit"
authors [
  "Fabian Affolter <fabian@engineering.ch>", # 2014-07-20
  # v0.1 # 2014-07-20 # Initial version. 
]
version "0.1"
description "A web frontend for git repositories written in C."
website "http://git.zx2c4.com/cgit/"

# Matches #
matches [
# ID
{ :text=>"<div id='cgit'><table id='header'>" },

# Default CSS
{ :text=>"<link rel='stylesheet' type='text/css' href='/cgit.css'/>" },

# Footer
{ :text=>"<div class='footer'>Copyright &copy; 2000 &ndash; 20[\d]{2} Jason A. Donenfeld. All Rights Reserved.</div>" },

# Generator
{ :name=>'meta generator',
:text=>"<meta name='generator' content='cgit v([^\s]+)'\/>"
},

]

# Passive #
passive do
	m=[]
    # Version detection
	if @body =~ /<meta name='generator' content='cgit v([^\s]+)'\/>/
		version = @body.scan(/<meta name='generator' content='cgit v([^\s]+)'\/>/)[0][0]
		m << { :version=>version }
	end
	m

end

end

