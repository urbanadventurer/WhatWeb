##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CrazyEgg" do
author "Peter van der Laan"
version "0.1"
description "Visualizes where your visitors click"
website "http://www.crazyegg.com/"

matches [

# HTML
{ :text=>"cetrk.com" },
{ :account=>/dnn506yrbagrg\.cloudfront\.net\/pages\/scripts\/(\d+\/\d+)/}

]

end

