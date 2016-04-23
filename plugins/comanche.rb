##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Comanche" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-24
version "0.1"
description "Comanche is an open-source web server for Squeak. Comanche contains the server framework, which makes it possible to develop web applications entirely in Squeak, without the need to run an external web server."
website "http://wiki.squeak.org/swiki"



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Comanche\/([^\s]+)/ },

]

end

