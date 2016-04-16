##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Softbiz-Freelancers-Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.1"
description "Softbiz Freelancers Script is an Extensive and Powerful script written in PHP to launch your own Freelancers website."
website "http://www.softbizscripts.com/freelancers-script-features.php"

# 4 results "powered by Freelancers Script" @ 2010-08-08
# Dorks #
dorks [
'"powered by Freelancers Script"'
]



matches [

# Certainty of 25 as this string is used by several softbiz scripts
# Uncomment these lines to use
#{ :text=>'by <a class="softbiz" href="http://www.softbizscripts.com" target="_blank">Softbiz Scripts</a></font></font>', :certainty=>25 },
#{ :text=>'by <a class="softbiz" href="http://www.softbizscripts.com" target="_blank">SoftbizScripts</a></font></font>', :certainty=>25 },

# Admin Panel
{ :text=>'                  <div align="center"><font size="3"><strong>Softbiz SEO Freelancers Script</strong><br>' },

{ :text=>'<div align="right"><!-- --><font style="font-family: Arial, Helvetica, sans-serif;font-size: 12px;font-style: normal;color: #009900;font-weight: bold;">Powered By <a href="http://www.softbizscripts.com/freelancers-script-features.php" style="font-family: Arial, Helvetica, sans-serif;font-size: 12px;font-style: normal;color: #0099FF;font-weight: normal;" title="Softbiz Freelancers Script" target="_blank" >Freelancers script</a></font></div>' },

]


end

