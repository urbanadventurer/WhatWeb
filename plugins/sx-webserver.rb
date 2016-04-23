##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SX-Webserver" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.1"
description "SX-Webserver - a simple tcp socket web server - coded by: neotek of soldierx.com"

# Matches #
matches [

# HTTP Status Codes # 1.0 # Malformed HTML
{ :status=>400, :text=>"<head></head><body><html><h1>Error 400</h1><p>The server couldn't understand your request.</html></body>\r\n" },
{ :status=>403, :text=>"<head></head><body><html><h1>Error 403</h1><p>Forbidden.</html></body>\r\n" },
{ :status=>404, :text=>"<head></head><body><html><h1>Error 404</h1><p>Document not found.</html></body>\r\n" },
{ :status=>500, :text=>"<head></head><body><html><h1>Error 500</h1><p>The server encountered an unexpected condition which prevented it from fulfilling the request.</html></body>\r\n" },
{ :status=>501, :text=>"<head></head><body><html><h1>Error 501</h1><p>This feature is not implemented.</html></body>\r\n" },
{ :status=>505, :text=>"<head></head><body><html><h1>Error 505</h1><p>HTTP Version not supported.  This server supports HTTP 1.0 and HTTP 1.1.</html></body>\r\n" },

# Version Detection
{ :search=>"headers[server]", :version=>/^SX Webserver ([\d\.]{1,5})/ },

]

end


