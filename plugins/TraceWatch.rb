##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TraceWatch" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "TraceWatch Real Time Web Stats and Traffic Analysis Lets you keep track of the visitors to your website in real time with detailed statistics and deep analysis using an innovative user interface for FREE and helps you make your website more effective. Can be easily installed on any website supporting PHP and MySQL."
website "http://www.tracewatch.com/"

# Google results as at 2011-03-24 #
# 30 for "TraceWatch" "Website Statistics and Traffic Analysis Software" +author

# Dorks #
dorks [
'"TraceWatch" "Website Statistics and Traffic Analysis Software" "author"'
]



# Matches #
matches [

# h1 Heading
{ :text=>'<h1 class="main"><a href="http://www.tracewatch.com/"><img alt="TraceWatch" title="TraceWatch" src="./base/img/tracewatch' },

# Version Detection # Copyright Footer
{ :version=>/<a href="http:\/\/www\.tracewatch\.com\/">TraceWatch<\/a> V?([^\s]+) Copyright &copy;2004-20[\d]{2} Arash Dejkam/ },

]

end


