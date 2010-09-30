##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Apache-Default" do
author "Andrew Horton"
version "0.3"
description "homepage:www.apache.org"
examples %w| 121.72.245.103 202.89.39.193 http://113.21.226.227/|

# default apache pages
# <title>Test Page for Apache Installation</title>

matches [
{:text=>"<html><body><h1>It works!</h1></body></html>" },
{:text=>"<title>Test Page for Apache Installation</title>" },
{:text=>"<TITLE>Test Page for the SSL/TLS-aware Apache Installation on Web Site</TITLE>" },
{:text=>"<html>Apache is functioning normally</html>" },

{:name=>"This IP is being shared among many domains.", 
:text=>"<body><center>This IP is being shared among many domains.<br>\nTo view the domain you are looking for, simply enter the domain name in the location bar of your web browser.<br>" },
]

end



