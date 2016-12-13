##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HP-Printer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-17
version "0.1"
description "HP Printer"
website "http://www.hp.com/"

# ShodanHQ results as at 2011-09-17 #
# 1,778 for serial AccessCounter



# Matches #
matches [

# Model Detection # HTTP Server Header
{ :search=>"headers[server]", :model=>/^HP HTTP Server; HP (.+) series - / },

]

end

