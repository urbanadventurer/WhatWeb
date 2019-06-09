##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Web2py"
authors [
  "Napz <napzs@rocketmail.com>", # 2014-10-13
]
version "0.1"
description "Web2py - Free open source full-stack framework written in Pytho"
website "http://www.web2py.com/"

# Dorks #
dorks [
'"powered by Web2py"'
]



# Matches #
matches [

{ :search=>"headers[x-powered-by]", :string=>/web2py/ },
{ :text=>'<div id="serendipityLeftSideBar">' },

]


end
