##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Siemens-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "Siemens Router"
website "https://www.siemens.com/"

# ShodanHQ results as at 2011-11-22 #
# 5,120 for Siemens ADSL



# Matches #
matches [

# HTTP Header # WWW-Authenticate # Model Detection
{ :search=>"headers[www-authenticate]", :model=>/Basic realm="Siemens ADSL ([^"^\s]+)"/, :certainty=>75 },

]

end

