##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2017-11-27 # Andrew Horton
# Add website
##
# Version 0.2 # 2016-08-19 # Bhavin Senjaliya
# Add visid_incap_ cookie
##

Plugin.define do
name "Incapsula-WAF"
author "Aung Khant <http://yehg.net/>" # 2012-02-10
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
