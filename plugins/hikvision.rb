##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "HikVision"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-07-15
  "John de Kroon <john.de.kroon@cyberant.com" # 2025-10-15 added passive detection for newer versions
]
version "0.2"
description "HikVision cameras, Digital Video Servers (DVS) and Digital Video Records (DVR)"
website "http://www.hikvision.com/"

# ShodanHQ results as at 2011-07-15 #
# 58,133 for Hikvision-Webs

# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Hikvision-Webs$/ },

]

# Passive detection #
# In newer versions the server header is changed to just "Webs", which is too little to assume that it's HikVision.
# Therefore we also test for the redirect to the login page. The combination should be reliable.
passive do
    m=[]
    # Header check (case‑insensitive key lookup)
    server_header = @headers['server'] || @headers['Server']
    header_match  = server_header&.include?('Webs')

    # Body check – look for the exact JS string
    body_match = @body.include?('window.location.href = "./doc/page/login.asp?_"')

    m << { :certainty=>100 } if header_match && body_match

    m
end

end

