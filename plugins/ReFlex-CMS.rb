##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ReFlex-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.1"
description "ReFlex CMS is an extremely flexible ASP.NET based website and content management platform that can be used to construct highly functional commercial websites, social networking applications, intranets, personal portals and blog sites. ReFlex CMS can also be easily added to existing sites."
website "http://www.impelsystems.com.au/reflex-cms-website-framework/overview-5.aspx"



# Matches #
matches [

# Default CSS
{ :regexp=>/<link id="ctl00_hlnk[^"]+" rel="stylesheet" type="text\/css"[^>]+href="[^"]*\/Site\/Resources\/css\/(layout|styles).css" \/>/ },

# Admin Page # Default JavaScript
{ :text=>'var Page_Validators =  new Array(document.getElementById("ctl00_cphMain_rfvUserName"), document.getElementById("ctl00_cphMain_rfvUserPassword"));' },

# Admin Page # Default logo
{ :text=>'<img src="Resources/images/reflex.png" alt="ReFlex Administration" />' },

# Admin page # Default IE6 JavaScript
{ :text=>'<script defer type="text/javascript" src="Resources/js/pngfix.js"></script>' },

# Default logo # /Admin/Resources/images/reflex.png
{ :url=>"/Admin/Resources/images/reflex.png", :md5=>"982a1eb449c954d214307a20dc2301ea" },

]

end


