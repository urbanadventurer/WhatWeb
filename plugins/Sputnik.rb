##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sputnik" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-21
version "0.1"
description "Sputnik - An Extensible Wiki Engine in Lua - Sputnik is a content management system designed for extensibility. It works as a wiki out of the box, but can be extended into other things."
website "http://sputnik.freewisdom.org/"

# 128 for "Powered by Sputnik"

# Dorks #
dorks [
'"Powered by Sputnik"'
]



# Matches #
matches [

# Powered by text
{ :text=>"Powered by <a href='http://sputnik.freewisdom.org/'>Sputnik</a>" },
{ :text=>"Powered by <a href='http://spu.tnik.org/'>Sputnik</a>" },

]

# Passive #
def passive
	m=[]

	# Sputnik Cookie
	m << { :name=>"Sputnik Cookie" } if @headers["set-cookie"] =~ /^Sputnik_[a-z\d]{32}=/

	# Return passive matches
	m
end

end

