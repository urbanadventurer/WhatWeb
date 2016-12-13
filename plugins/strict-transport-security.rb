##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Strict-Transport-Security" do
author "Andrew Horton" # 2016-04-30
version "0.1"
description "Strict-Transport-Security is an HTTP header that restricts a web browser from accessing a website \
without the security of the HTTPS protocol."

matches [

{ :search=>"headers[Strict-Transport-Security]", :string=>/^(.*)$/ },

]

end

