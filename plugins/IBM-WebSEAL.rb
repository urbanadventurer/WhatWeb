##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IBM-WebSEAL" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-12
version "0.1"
description "IBM WebSEAL is a high-performance, multi-threaded Web server that applies fine-grained security policy to the Tivoli Access Manager protected Web object space."
website "http://publib.boulder.ibm.com/tividd/td/ITAME/SC32-1359-00/en_US/HTML/am51_webseal_guide02.htm#wq1"

# ShodanHQ results as at 2012-08-12 #
# 1,515 for WebSEAL



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^WebSEAL\/([^\s]+ \(Build \d+\))/ },

]

end

