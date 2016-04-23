##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SiteMajic" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-24
version "0.1"
description "SiteMajic - Web Content Management System service"
website "http://www.sitemajic.com/"

# Google results as at 2012-04-24 #
# 293 for "Website Powered by SiteMajic"
# 194 for inurl:"admin.php?op=login" inurl:"SiteId"

# Dorks #
dorks [
'"Website Powered by SiteMajic"'
]



# Matches #
matches [

# Admin Page
{ :text=>"<td width=109 align='left'><input type='text' name='UserName' size='20' style='font-family: Arial; font-size: 8pt;' onKeyPress=\"if (event.keyCode == 13) { document.frm.Password.focus(); return false;	} else return true;\" ></td>" },

# Powered by link
{ :text=>"Website Powered by <a href='http://www.sitemajic.com' style='text-decoration:none'>SiteMajic</a>" },

]

end

