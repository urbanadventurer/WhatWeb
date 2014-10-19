##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Perfectone-VOIP-Phone" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-14
version "0.1"
description "Perfectone VOIP phone"
website "http://www.perfectone.nl/"



# Matches #
matches [

{ :text=>'<body OnLoad="JavaScript:document.loginform.user.focus();">' },
{ :text=>'<p style="margin-top: 5px"><font face="Arial"><input type=submit value=\'Login\' onClick="return saveChanges()">' },
{ :text=>'<font face="Arial" color="#FFFFFF"><b>Login VoIP</b></font></i></td> </tr>' },

]

end

