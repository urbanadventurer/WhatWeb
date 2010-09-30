##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :name and :certainty=>100


Plugin.define "CPanel" do
author "Andrew Horton"
version "0.2"
description "homepage:www.cpanel.net"
examples %w| 202.191.40.29 |

# default apache + cpanel

# <title>cPanel&reg;</title>
# <div id="footer_images"><img src="sys_cpanel/images/powered_by.gif" />
# Apache is working on your cPanel<sup>&reg;</sup> and WHM&#8482; Server
# 

matches [
{:text=>"<title>cPanel&reg;</title>" },
{:text=>'<div id="footer_images"><img src="sys_cpanel/images/powered_by.gif" />' },
{:text=>"Apache is working on your cPanel<sup>&reg;</sup> and WHM&#8482; Server" }
]



end



