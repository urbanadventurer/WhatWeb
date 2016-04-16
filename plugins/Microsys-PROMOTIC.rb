##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Microsys-PROMOTIC" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-05
version "0.1"
description "Microsys PROMOTIC web interface - PROMOTIC is a complex SCADA object software tool for creating applications that monitor, control and display technological processes in various industrial areas."
website "http://www.promotic.eu/en/promotic/scada-pm.htm"

# More Info #
# https://en.wikipedia.org/wiki/PROMOTIC_SCADA_system

# Default Login #
# oper:<blank>

# ShodanHQ results as at 2011-04-05 #
# 341 for server promotic location -apache -iis -nginx -Mikrotik -BigIP



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Promotic$/ },

# Redirect Page # /
{ :text=>'<html><head><title>PROMOTIC Redirection</title></head>' },

]

end

