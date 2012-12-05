##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AJA-Video-Converter" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-12-05
version "0.1"
description "AJA digital video converter devices - Homepage: http://www.aja.com/en/products/convert/"

# Examples #
examples %w|
129.15.37.9
66.151.63.115
76.8.60.33
76.8.60.34
207.212.211.17
71.166.174.173
150.135.129.114
35.9.117.106
35.9.117.107
35.9.117.108
35.9.117.109
|

# Matches #
matches [

# FS1 # Title
{ :text=>'<title>AJA Video - FS1 Admin: Main</title> <link href="/css/aja_fs1.css"', :model=>"FS1" },

# System Name # /json?action=get&configid=0&alt=json&paramid=eParamID_SysName
{ :url=>"/json?action=get&configid=0&alt=json&paramid=eParamID_SysName", :string=>/\{"paramid":"839188480","name":"eParamID_SysName","value":"([^\"]+)"/ },

]

end

