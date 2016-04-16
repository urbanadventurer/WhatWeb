##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FreeNAC" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-20
version "0.1"
description "FreeNAC is an OpenSource solution for LAN access control and dynamic Vlan management"
website "http://freenac.net/"

# Google results as at 2012-05-20 #
# 1 for inurl:"stats.php?graphtype=bar"



# Matches #
matches [

# Menu HTML
{ :text=>'<a href="unknowns.php" title="List unknown end devices and print/edit/delete them">Find unknowns</a><br/>' },

]

end

