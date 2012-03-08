##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "qTranslate" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-09
version "0.1"
description "qTranslate Wordpress plugin - Homepage: http://www.qianqin.de/qtranslate/"

# ShodanHQ results as at 2012-03-09 #
# 1,437 for qtrans_cookie_test

# Examples #
examples %w|
212.52.176.22
72.18.153.220
67.159.221.18
183.181.14.59
77.55.63.158
175.41.255.240
208.64.68.60
85.128.204.30
217.16.1.209
142.137.247.35
|

# Matches #
matches [

# Set-Cookie # qtrans_cookie_test
{ :search=>"headers[set-cookie]", :regexp=>/qtrans_cookie_test=[^\+]+\+Cookie\+Test;/ },

]

end

