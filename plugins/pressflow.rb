##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pressflow" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.1"
description "Pressflow is a distribution of Drupal with integrated performance, scalability, availability, and testing enhancements."
website "http://pressflow.org/"

# 67 results for +"powered by Pressflow" +"an open source content management system" @ 2010-07-18

# Dorks #
dorks [
'"powered by Pressflow" "an open source content management system"'
]



matches [

{ :regexp=>/<a href="http:\/\/drupal.org"><img src="[\/a-zA-Z0-9\-\_+]*\/misc\/powered-blue-80x15.png" alt="Powered by Pressflow, an open source content management system" title="Powered by Pressflow, an open source content management system" width="80" height="15" \/><\/a>/ },

{ :text=>'<title>Drupal already installed | Pressflow</title>', :version=>"Install Page" },

]

end

