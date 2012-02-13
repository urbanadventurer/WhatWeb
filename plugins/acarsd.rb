##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "acards" do
author "Andrew Horton"
version "0.1"
description "acarsd is an Aircraft Communication Addressing and Reporting System (ACARS) decoder for a LINUX or Windows. It decodes ACARS transmissions collected from a radio scanner in real-time using sound cards. acarsd also provides realtime webserver. Homepage: http://www.acarsd.org/"
examples %w| http://acars.melradar.com:8082 http://stnsbs.com:8082 http://72-5-109-216.acsol.net:81 |


matches [
{:version=>/^acarsd\/(.*$)/, :search=>"headers[server]" }, 
{:regexp=>"<title>[^<]*RealTime Web ACARS" }

]


end

