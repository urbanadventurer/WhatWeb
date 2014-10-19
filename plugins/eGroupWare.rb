##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eGroupWare" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-06
version "0.1"
description "Egroupware is a web based software for team collaboration, central data management and CRM: email client, online calendar, contact and task management, project and file management, trouble ticket system, synchronization."
website "http://www.egroupware.org/"
# Manual: http://www.stylite.de/egroupware_manuals

# 25 results for inurl:"phpgw_forward" ext:php @ 2011-01-06

# Dorks #
dorks [
'inurl:"phpgw_forward" ext:php'
]



# Matches #
matches [

	# Default meta author
	{ :text=>'<meta name="author" content="eGroupWare http://www.egroupware.org" />' },

	# Version Detection # PoweredBy footer
	{ :version=>/<div id="divPoweredBy>[^<]*<a href="http:\/\/www.egroupware.org">eGroupWare<\/a> version ([\d\.]+)<\/span><\/div>/ },

	# Version Detection # PoweredBy footer
	{ :version=>/<a href="http:\/\/www.egroupware.org" target="_blank">eGroupWare<\/a> ([\d\.]+)[^<]*<\/div>/ },

	# Login page # session expired # french
	{ :text=>'<div align="center"><font color="#FF0000">Votre session n\'est pas valide.</font></div>', :string=>"Language:French" },

	# Login page # session expired # english
	{ :text=>'<div id="loginCdMessage"><font color="red">Your session could not be verified.</font></div>', :string=>"Language:English" },

	# Login Page # password.png md5sum
	{ :md5=>"628381f4ef8ee6d35665e002ffa61bb0", :url=>"phpgwapi/templates/idots/images/password.png" },

	# Default favicon
	{ :md5=>"f6e9339e652b8655d4e26f3e947cf212", :url=>"phpgwapi/templates/idots/images/favicon.ico" },

	# Login Page # Default Title
	{ :text=>"<title>EGroupware [Login]</title>" },

	# meta copyright
	{ :string=>/<meta name="copyright" content="eGroupWare http:\/\/www.egroupware.org \(c\) ([\d\.]+)" \/>/i },

	# 1.3 - 1.6 # HTML Comment
	{ :text=>"<!-- we don't need body tags anymore, do we?) we do!!! onload!! LK -->", :version=>"1.3 - 1.6" },

	# Expresso Livre # powered by eGroupWare
	{ :text=>'<META NAME="description" CONTENT="Expresso Livre login screen, working environment powered by eGroupWare">', :module=>"Expresso Livre" },
	{ :text=>'<META NAME="keywords" CONTENT="Expresso Livre login screen, eGroupWare, groupware, groupware suite">', :module=>"Expresso Livre" },
	{ :text=>'<br><a title="eGroupWare" target="_blank" href="http://www.egroupware.org/"> Powered by eGroupWare </a></div></td>', :module=>"Expresso Livre" },
	{ :text=>"<TITLE>Expresso Livre - Login</TITLE>", :module=>"Expresso Livre" }

]

end


