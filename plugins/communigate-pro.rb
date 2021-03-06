##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "CommuniGate-Pro"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-23
  "Andrew Horton", # v0.2 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "CommuniGate Pro provides an integrated platform for Store-and-Forward (E-mail, Calendaring) and Real-Time (VoIP, Video, Instant Messaging, White Boards) communications over IPv4 and IPv6 networks."
website "http://www.communigate.com/cgatepro/"

# ShodanHQ results as at 2011-05-23 #
# 9,594 for CommuniGatePro

matches [

	{:version=>/^CommuniGatePro\/([^\s]+)$/, :search=>"headers[server]"},

]

end

