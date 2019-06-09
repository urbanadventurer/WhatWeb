##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "DynamicWeb"
authors [
  "Guillaume Delacour <gui@iroqwa.org>", # 2017-04-15
]
version "0.1"
description "Dynamicweb is the All-In-One Platform for Content Management, Ecommerce, Digital Marketing and Integration."
website "https://dynamicweb.com/"

# Matches #
matches [
# Version in Meta Generator
{ :version=>/<meta name="generator" content="Dynamicweb ([^\s]+)"/ },
# comment
{ :certainty=>100, :regexp=>/\(c\) 1999-(20[\d]{2}) Dynamicweb Software A\/S/ },
# Set-Cookie
{ :certainty=>75, :search=>"headers[set-cookie]", :regexp=>/Dynamicweb/ },
]
end
