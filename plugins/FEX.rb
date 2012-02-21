##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FEX" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-22
version "0.1"
description "F*EX (Frams's Fast File EXchange) is a service that can be used to allow users anywhere on the Internet to exchange files of ANY size quickly and conveniently. - Homepage: http://fex.rus.uni-stuttgart.de/fex.html"

# ShodanHQ results as at 2012-02-22 #
# 51 for fexsrv

# Google results as at 2012-02-22 #
# 13 for intitle:"F*EX - File EXchange" "F*EX - Frams' Fast File EXchange"

# Dorks #
dorks [
'intitle:"F*EX - File EXchange" "F*EX - Frams\' Fast File EXchange"'
]

# Examples #
examples %w|
87.204.56.180
157.99.62.159
176.9.82.163
213.73.74.232
194.98.76.2
82.195.74.15
134.108.32.3
fex.rus.uni-stuttgart.de
fex.pink.de
exo.iee.lu:31416
server2.rz.uni-leipzig.de
fex.rus.uni-stuttgart.de:8080/index.html
https://vermittlerservice.deltalloyd.de
|

# Matches #
matches [

# /logo.jpg
{ :url=>"/logo.jpg", :md5=>"ad8a95bba8dd1a61d70bd38611bc2059" },

# Title
{ :text=>'<HEAD><TITLE>F*EX - File EXchange</TITLE></HEAD>' },

# h1 heading
{ :certainty=>75, :text=>"<h1>F*EX - Frams' Fast File EXchange" },

# email address
{ :regexp=>/<a href="mailto:[^"]+">fexmaster<\/a><\/address>/i },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^fexsrv$/ },

]

end

