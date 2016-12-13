##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dolphin" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-05
version "0.1"
description "Dolphin is built using PHP and MySQL running on Apache. It is tested and proven stable running on Linux. Dolphin will also run on Windows if needed."
website "http://www.busmgtsys.com/"



# Matches #
matches [

# Login Page # Title
{ :text=>'<title>Dolphin Log In</title>' },

# Login Page # PHP_AUTH_PW
{ :text=>'<td><input name="PHP_AUTH_PW" type="password"></td>' },

# Login Page # PHP_AUTH_USER
{ :text=>'<td NOWRAP><input name="PHP_AUTH_USER" type="text"></td>' },

# Login Page # body onload="focus_username();"
{ :text=>'<body onload="focus_username();" bottommargin="0" rightmargin="0" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">' },

]

end

