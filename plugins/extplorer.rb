##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eXtplorer" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-12-31
version "0.1"
description "eXtplorer is a PHP and Javascript-based File Manager"
website "http://extplorer.net/"

# ShodanHQ results as at 2012-12-31 #
# 412 for Set-Cookie eXtplorer



# Matches #
matches [

# ./extplorer.xml # Version Detection
{ :url=>'/extplorer.xml', :version=>/<version>([^<]+)<\/version>/ },

# Title
{ :text=>'<title>Login - eXtplorer</title>' },

]

end

