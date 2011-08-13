##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Gitorious" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-13
version "0.1"
description "Gitorious provides open source infrastructure for hosting open source projects that use Git - Requires: Ruby. - Homepage: https://gitorious.org/gitorious"

# ShodanHQ results as at 2011-08-13 #
# 79 for _gitorious_sess

# Google results as at 2011-08-13 #
# 103 for intitle:"Gitorious" "Gitorious is a great way of collaborating on distributed open source projects" "About Gitorious" "Dashboard" "Login"

# Dorks #
dorks [
'intitle:"Gitorious" "Gitorious is a great way of collaborating on distributed open source projects" "About Gitorious" "Dashboard" "Login"'
]

# Examples #
examples %w|
gitorious.org
91.199.154.106
12.139.154.102
88.198.108.178
87.238.52.168
131.179.196.47
82.192.66.99
147.65.1.94
|

# Matches #
matches [

# Powered by footer
{ :regexp=>/<a href="http:\/\/gitorious\.org"><img alt="Poweredby" src="\/images\/\.\.\/img\/poweredby\.png\?[\d]+" title="Powered by Gitorious" \/><\/a><\/div>/ },

# _gitorious_sess Cookie
{ :search=>"headers[set-cookie]", :regexp=>/_gitorious_sess=[^-]+--[^;]+; domain=/ },

]

end

