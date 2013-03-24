##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eXtplorer" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-12-31
version "0.1"
description "eXtplorer is a PHP and Javascript-based File Manager - Homepage: http://extplorer.net/"

# ShodanHQ results as at 2012-12-31 #
# 412 for Set-Cookie eXtplorer

# Examples #
examples %w|
216.75.41.186
66.240.197.213
206.210.92.5
175.139.142.172
85.221.20.76
23.23.84.150
142.4.205.66
80.246.124.82
80.81.249.82
176.34.107.135
77.68.38.14
217.26.55.18
g4cftp.com
donesto.ru
www.upload.vietnamtrongtimtoi.info/upload-manual/
|

# Matches #
matches [

# ./extplorer.xml # Version Detection
{ :url=>'/extplorer.xml', :version=>/<version>([^<]+)<\/version>/ },

# Title
{ :text=>'<title>Login - eXtplorer</title>' },

]

end

