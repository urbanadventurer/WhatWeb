##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Specialix-JETSTREAM" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-04
version "0.1"
description "Specialix JETSTREAM Network Access Server allows authorized remote users to dial into a network to access email; share documents; connect to the Internet; and print documents on the network's printers."

# ShodanHQ results as at 2011-09-04 #
# 12 for Specialix



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Specialix JETSTREAM ([\d\.]+)$/ },

]

end

