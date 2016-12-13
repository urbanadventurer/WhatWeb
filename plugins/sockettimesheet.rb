##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SocketTimesheet" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-08
version "0.1"
description "PHP Timesheet web application"
website "http://www.sockettimesheet.com/"

# 2 Google results for Login Password Template Access "Enter Login and Password to Proceed" ext:php inurl:login


matches [

# Login page # login.php # Default JavaScript error message
{ :text=>"alert('You Are Using '+browser+' Version '+version+', a Non-Tested Browser For This Application. Currently Supported Browsers Are:\\n\\n1. Internet Explorer 6 and Above\\n2. Firefox 2 and Above\\n3. Netscape 8 and Above\\n\\nIf You Experience Any Problem, Please Change To The Supported Browser As Listed Above. Thank You.');", :version=>"3.x" },
{ :text=>"alert('You Are Using '+browser+', a Non-Supported Browser For This Application\\nCurrently Supported Browsers Are:\\n1. Internet Explorer\\n2. Firefox (with IETab Enabled)\\n\\nSome Critical Functionalities May Not Work With '+browser);", :version=>"<= 2.x" },

# Version Detection # login.php
{ :version=>/<td valign="top" align="left"><img src=login_images\/index_01.gif><\/td><td valign="bottom" nowrap class="td_title" width="100%">v ([\d\.]+)<\/td>/ },

]

end

