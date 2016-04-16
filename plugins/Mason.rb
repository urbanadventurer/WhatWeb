##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mason" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-11-04
version "0.1"
description "Mason is a powerful Perl-based templating system for generating HTML or other dynamic content."
website "http://www.masonhq.com/"

# ShodanHQ results as at 2012-11-04 #
# 27 for X-Powered-By: HTML::Mason



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[x-powered-by]", :regexp=>/HTML::Mason/ },

]

end

