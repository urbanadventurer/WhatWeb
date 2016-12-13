##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Toshiba-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "Toshiba network camera web interface"
website "http://www.toshiba.com/"



matches [

{ :text=>'<title>TOSHIBA Network Camera - User Login</title>' },

{ :text=>'    <td height="32"><img src="toshiba.gif" width="68" height="12"><font class="netcam"><strong>&nbsp;&nbsp;Network Camera</strong></font></td>' },

]


end

