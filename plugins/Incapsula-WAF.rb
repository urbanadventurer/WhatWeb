##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Incapsula-WAF" do
author "Aung Khant <http://yehg.net/>" # 2012-02-10
version "0.1"
description "Incapsula-WAF - http://www.incapsula.com"



# Matches #
matches [
{:name => 'Set-cookie Header', :search=>"headers[set-cookie]", :regexp=>/incap_ses_/i},
{:name => 'Set-cookie Header', :search=>"headers[set-cookie]", :regexp=>/incap_visid_83_/i}
]

end
