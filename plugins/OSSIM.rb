##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OSSIM" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-15
version "0.1"
description "AlienVault OSSIM (Open Source Security Information Management). Its goal is to provide a comprehensive compilation of tools which, when working together, grant network/security administrators with a detailed view over each and every aspect of his or her networks, hosts, physical access devices, server, etc. - Homepage: http://alienvault.com/community"

# ShodanHQ results as at 2011-04-15 #
# 152 for OSSIM

# Google results as at 2011-04-15 #
# 5 for intitle:"AlienVault - Open Source SIM" Maximized User Password

# Dorks #
dorks [
'intitle:"AlienVault - Open Source SIM" Maximized User Password'
]

# Examples #
examples %w|
142.158.8.28
115.108.10.50
200.174.1.20
64.94.230.226
132.248.139.81
66.8.71.194
174.142.215.161
174.142.215.162
206.40.99.123
ns2.desenhovoce.com/ossim/
|

# Matches #
matches [

# Default Title
{ :text=>'<title> AlienVault - Open Source SIM </title>' },

# Table HTML
{ :text=>'<table align="center" style="padding:1px;background-color:#f2f2f2;border-color:#aaaaaa" class=nobborder><tr><td class="nobborder">' },

# Table HTML
{ :text=>'<table align="center" cellspacing=4 cellpadding=2 style="background-color:#eeeeee;border-color:#dedede">' },

]

end


