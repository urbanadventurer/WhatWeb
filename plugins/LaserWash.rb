##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LaserWash" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-07-28
version "0.1"
description "PDQ - LaserWash - touchless car wash equipment. - Homepage: http://www.pdqinc.com/car-wash-equipment/laserwash-360.asp"

# ShodanHQ results # 2013-07-28
# 42 for "PDQ Laserwash"

# Examples #
examples %w|
99.61.146.62
24.111.10.26
108.242.203.234
99.70.61.76
173.14.186.186
|

# Matches #
matches [

# WWW-Authenticate realm
{ :status=>401, :search=>"headers[www-authenticate]", :regexp=>/^Basic realm="PDQ Laserwash"$/ },

]

end

