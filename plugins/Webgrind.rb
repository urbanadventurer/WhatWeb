##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Webgrind" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-05
version "0.1"
description "Webgrind is an Xdebug profiling web frontend in PHP5. It implements a subset of the features of kcachegrind and installs in seconds and works on all platforms."
website "https://github.com/jokkedk/webgrind"

# Google results as at 2011-03-05 #
# 10 for intitle:"Webgrind" "profiling in the browser" +percent +milliseconds +microseconds

# Dorks #
dorks [
'intitle:"Webgrind" "profiling in the browser" "percent" "milliseconds" "microseconds"'
]



# Matches #
matches [

# different functions HTML
{ :text=>'<span id="invocation_sum"></span> different functions called in <span id="runtime_sum"></span> milliseconds (<span id="runs"></span> runs, <span id="shown_sum"></span> shown)' },

# reloadFilelist image HTML
{ :text=>'<img class="list_reload" src="img/reload.png" onclick="reloadFilelist()">' },

# Version detection # h1 title
{ :version=>/<h1>webgrind<sup style="font-size:10px">v([^<]+)<\/sup><\/h1>/ },

]

end


