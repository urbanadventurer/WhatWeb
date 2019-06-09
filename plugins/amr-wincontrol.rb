##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "AMR-WinControl"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-11-01
  "Andrew Horton", # v0.2 # 2016-04-18 # Replaced passive function with match. 
]
version "0.2"
description "This plugin identifies AMR-WinControl server"
website "http://amr-wincontrol.software.informer.com/"

# 6 ShodanHQ results for "Server: AMR_WinControl" @ 2010-11-01

matches [
 { :search=>"headers[server]", :version=>/AMR_WinControl[_0-9]*\/([\d\.]+)/ },
]


end

