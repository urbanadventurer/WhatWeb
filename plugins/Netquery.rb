##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Netquery" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-20
version "0.1"
description "Netquery is a complete PHP/SQL open-source toolkit of network utilities. Available as a standalone application and as a module for the following CMSs: e107, PHP-Fusion, Xaraya, Xoops and Zikula."
website "http://virtech.org/tools/"

# 89 results for inurl:"nquser.php" filetype:php -inurl

# Dorks #
dorks [
'inurl:"nquser.php" filetype:php -inurl'
]



# Matches #
matches [

# Default form
{ :text=>'<form class="nquser" action="nquser.php" method="post">' },

# Default link + img class
{ :text=>'<a href="nquser.php?querytype=countries"><img class="gobuttonup"' },

# legend tag
{ :certainty=>75, :text=>'<legend>NQ User Interface</legend>' },

# Top countries link
{ :certainty=>75, :text=>'<br /><a href="nquser.php?formtype=countries">Top Countries' },

# Admin link
{ :text=>'<a href="nqadmin.php"><img class="gobutton" src="images/btn_adm.gif" alt="Administration" /></a>' },

# Error # Could not retrieve Netquery configuration data from the database.
{ :md5=>"24a75ccc492b5a9118a4d226c25895c1" },

]

end


