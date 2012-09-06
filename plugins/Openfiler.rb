##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Openfiler" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-06
version "0.1"
description "Openfiler is an Open Source Network Attached Storage and Storage Area Network Solution. - Homepage: http://www.openfiler.com/ "

# Default Login # openfiler/password
# Default Port  # 446 (HTTPS)

# Examples #
examples %w|
https://203.145.207.114:446/
https://110.74.207.186:446/
|

# Matches #
matches [

# /uptime.html
{ :url=>"/uptime.html", :text=>'<div id="uptimeDiv" class="uptimeDiv"><span style="line-height: 10px;" id="uptimeData"></span> </div></body>' },

# /uptime.html
{ :url=>"/uptime.html", :text=>'<body bgcolor="#4c555a" style="margin: 0; padding: 0" onload="getSysUptime()">' },

# / # Version Detection
{ :version=>/<div><p style="font-size: 90%; color: #aaa; line-height: 14px;"><strong>Distro Release:&nbsp;<\/strong>Openfiler NSA ([^\s]+)/ },

# / # GUI Version Detection
{ :string=>/<strong>GUI Version:&nbsp;<\/strong>([^<^\s]+)<\/p><\/div>/ },

]

end

