##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "synType-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "synType CMS is a free, open source Web Content Management System. synType CMS is fast, secure, stable and easy to learn."
website "http://syntype.org/"



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="synType CMS" />' },

# Powered by logo
{ :text=>'width="150" height="40" border="0" alt="This Web site is powered by synType CMS, the ultimate Content Management System" /></a>' },

]

end


