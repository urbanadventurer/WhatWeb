##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "qTranslate" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-09
version "0.1"
description "qTranslate Wordpress plugin"
website "http://www.qianqin.de/qtranslate/"

# ShodanHQ results as at 2012-03-09 #
# 1,437 for qtrans_cookie_test



# Matches #
matches [

# Set-Cookie # qtrans_cookie_test
{ :search=>"headers[set-cookie]", :regexp=>/qtrans_cookie_test=[^\+]+\+Cookie\+Test;/ },

]

end

