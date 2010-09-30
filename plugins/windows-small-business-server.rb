##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100 & :name

Plugin.define "WindowsSBS" do
author "Andrew Horton"
version "0.2"
description "Microsoft Small Business Server Homepage:www.microsoft.com/sbs/en/us/default.aspx"
examples %w| 210.54.213.143 cgamining.com phillipfparsons.com www.bonesucks.com  |

# this needs more examples

# <title>Welcome to Windows Small Business Server 2003</title>
# these are all 2003

matches [
{:version=>2003, :text=>'<title>Welcome to Windows Small Business Server 2003</title>' },

{:name=>"Remote Web Workplace link",
:text=>'<TD id="Remote_Link" class="linkHeader"><A HREF="/Remote">Remote Web Workplace</A></TD>' },

{:name=>"sbslogo.gif", :certainty=>75, :text=>'<IMG alt="" src="images/sbslogo.gif" border="0" width="200" height="55">' }

]


end

