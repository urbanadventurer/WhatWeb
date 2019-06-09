##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Incapsula-WAF"
authors [
  "Aung Khant <http://yehg.net/>", # 2012-02-10
  "Bhavin Senjaliya", # v0.2 # 2016-08-19 # Add visid_incap_ cookie. 
  "Andrew Horton", # v0.3 # 2017-11-27 # Add website. 
]
version "0.3"
description "Incapsula-WAF"
website "http://www.incapsula.com"

# Matches #
matches [
{:name => 'Set-cookie Header', :search=>"headers[set-cookie]", :regexp=>/incap_ses_/i},
{:name => 'Set-cookie Header', :search=>"headers[set-cookie]", :regexp=>/incap_visid_83_/i},
{:name => "visid_incap_ cookie", :search => "headers[set-cookie]", :regexp => /^visid_incap_/ },

]

end
