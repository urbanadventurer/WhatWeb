##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iGiveTest" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-23
version "0.1"
description "iGiveTest is a comprehensive solution for creating, administering, and providing thorough analysis of tests on the Internet and Intranet. It is a quick and professional way to create and organize tests for employees, students, and people in training."
website "http://igivetest.com/"

# Google results as at 2011-03-23 #
# 175 for "Powered by iGiveTest"
# 29 for "Powered by iGiveTest v1.9.7"

# Dorks #
dorks [
'"Powered by iGiveTest"'
]



# Matches #
matches [

# Version Detection # Powered by link
{ :version=>/Powered by <a href="http:\/\/iGiveTest\.com" target=_blank>iGiveTest v([\d\.]+)<\/a>/ },

# Version Detection # Powered by text
{ :version=>/<tr><td colspan=[\d] align=right>Powered by iGiveTest v([\d\.]+)<\/a><\/td><\/tr>/ },

# Login Form
{ :certainty=>25, :text=>'<form action="index.php" method=post name=signinform>' },

]

end


