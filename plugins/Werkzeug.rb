##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Werkzeug" do
author "Brendan Coles <bcoles@gmail.com>" # 2015-04-30
version "0.1"
description "Werkzeug is a WSGI utility library for Python. - Homepage: http://werkzeug.pocoo.org/"

# About 2667 ShodanHQ results for server:Werkzeug @ 2015-04-30

matches [

# HTTP Server Header
{ :search=>"headers[server]", :version=>/^Werkzeug\/([\d\.]+)/ },

# 302 Page # Redirect Text
{ :status=>302, :certainty=>75, :text=>'<p>You should be redirected automatically to target URL:' },

]

end

