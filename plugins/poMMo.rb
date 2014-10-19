##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "poMMo" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-11
version "0.1"
description "poMMo is versatile mass mailing software - Requires PHP"
website "http://pommo.org/Main_Page"

# Google results as at 2012-11-04 #
# 413 for "Page fueled by poMMo mailing management software"

# Dorks #
dorks [
'"Page fueled by poMMo mailing management software"'
]



# Matches #
matches [

# Fueled by link
{ :text=>'Page fueled by <a href="http://www.pommo.org/">poMMo</a> mailing management software' },
{ :text=>'Page fueled by <a href="http://pommo.sourceforge.net/">poMMo</a> mailing management software' },

# Title
{ :text=>'<title>. ..poMMo.. .</title>' },

]

end

