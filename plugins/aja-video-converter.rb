##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AJA-Video-Converter" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-12-05
version "0.1"
description "AJA digital video converter devices"
website "http://www.aja.com/en/products/convert/"



# Matches #
matches [

# FS1 # Title
{ :text=>'<title>AJA Video - FS1 Admin: Main</title> <link href="/css/aja_fs1.css"', :model=>"FS1" },

# System Name # /json?action=get&configid=0&alt=json&paramid=eParamID_SysName
{ :url=>"/json?action=get&configid=0&alt=json&paramid=eParamID_SysName", :string=>/\{"paramid":"839188480","name":"eParamID_SysName","value":"([^\"]+)"/ },

]

end

