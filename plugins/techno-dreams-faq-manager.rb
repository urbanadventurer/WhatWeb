##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FAQ-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-29
version "0.1"
description "A full and ready to use ASP Script that enables you managing a FAQ List for your site. It lists FAQ questions and answers by categories. With search capabilities."
website "http://www.t-dreams.com/faqmanager.asp"

# This plugin is sketchy at best as there are no example sites available @ 2010-08-29


matches [

# Login link
{ :text=>'		<a href="admin/">Admin Area</a></td></tr></table></body></html>' },

# Admin page
{ :text=>'		<td><font size="-1">&nbsp;</font><p><b><font size="-1">FAQ ADMIN AREA</font></b></td>' },

]


end

