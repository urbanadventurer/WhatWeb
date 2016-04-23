##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Socorro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-07
version "0.1"
description "A server for collecting, processing, and displaying crash reports from clients using the Breakpad libraries"
website "code.google.com/p/socorro/"

# Google resutls as at 2011-08-07 #
# 26 for "Powered by Socorro"

# Dorks #
dorks [
'"Powered by Socorro"'
]



# Matches #
matches [

# Powered by link
{ :text=>'Powered by <a href="http://code.google.com/p/socorro/">Socorro</a>' },

]

end

