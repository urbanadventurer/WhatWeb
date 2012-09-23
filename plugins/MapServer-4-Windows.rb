##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MapServer-4-Windows" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "MapServer for Windows (MS4W) - Homepage: http://www.maptools.org/ms4w/"

# Examples #
examples %w|
155.207.43.17
194.199.251.166
192.35.98.160
152.92.4.94
190.24.137.84
77.211.253.3
93.174.143.152
|

# Matches #
matches [

# / # Title
{ :text=>'<title>MS4W - MapServer 4 Windows</title>' },

# / # Heading # Version Detection
{ :version=>/<h1>MS4W - MapServer 4 Windows - version ([^<]+)<\/h1>\s+<h2>Introduction<\/h2>/ },

]

end

