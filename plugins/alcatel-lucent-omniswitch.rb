##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Alcatel-Lucent-Omniswitch" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-15
version "0.1"
description "Alcatel Lucent's Omniswitch"
# Default login: admin/switch

# 1 result for intitle:"Webview+Logon+Page" @ 2010-07-15


matches [

{:text=>'<title>Webview Logon Page</title>' },

{:text=>'document.write(errMsg==""?"&nbsp;":("<u>Error</u>&nbsp;-&nbsp;" + errMsg));' }

]

end

