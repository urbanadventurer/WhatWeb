##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-17 # Andrew Horton
# Added website
##
# Version 0.2
# removed :name and :certainty=>100
##
Plugin.define "DiBos" do
author "Andrew Horton"
version "0.3"
description "DiBos security surveillance system"
website "http://www.boschsecurity.com/"

# Dorks #
dorks [
'intitle:"DiBos - Login"'
]

#<OBJECT id="Loader" style="width:0;height:0" codeBase='cab/Dibos80.CAB#version=8,5,0,1092' classid="CLSID:6F83F815-49D0-46BB-A81C-A9D18C33A0E7"

#"\r\n<script language=\"jscript\"  src=\"Scripting/ScriptLib.js\"></script>\r\n\r\n\r\n\r\n\r\n\r\n<html>\r\n<META HTTP-EQUIV=\"Pragma\" CONTENT=\"no-cache\">\r\n<META HTTP-EQUIV=\"Expires\" CONTENT=\"-1\">\r\n\r\n<head>\r\n<TITLE>DiBos - Login</TITLE>\r\n<link rel=\"STYLESHEET\" type=\"text/css\" href=\"style/bovisnt.css\"></link>\r\n</head>\r\n\r\n<body>\r\n<!-- Page start -->\r\n<table border=\"0\">\r\n<tr>\r\n<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>\r\n<td class=\"errorStyle\">\r\nPlease update your browser version.<br>Microsoft Internet Explorer 5.0 or higher is supported.\r\n</td>\r\n</tr>\r\n<tr><td colspan=\"2\">&nbsp;</td></tr>\r\n</table>\r\n\r\n\r\n\r\n</body>\r\n</html>\r\n"

# Matches #
matches [

{:regexp=>/<title>DiBos - Login<\/title>/i },

{:text=>'<link rel="STYLESHEET" type="text/css" href="style/bovisnt.css"></link>' },

# Object moved text for non-IE browsers
{:text=>'<h2>Object moved to <a href="/Error.aspx?error=wrongbrowser">here</a>.</h2>'}

]

end

