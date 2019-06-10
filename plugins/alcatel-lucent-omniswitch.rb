##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Alcatel-Lucent-Omniswitch"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-07-15
  "Andrew Horton", # v0.2 # 2019-07-10 # Added website field.
]
version "0.2"
description "Alcatel Lucent's Omniswitch"
website "https://www.al-enterprise.com/en/products/switches"
# Default login: admin/switch

# 1 result for intitle:"Webview+Logon+Page" @ 2010-07-15


matches [

{:text=>'<title>Webview Logon Page</title>' },

{:text=>'document.write(errMsg==""?"&nbsp;":("<u>Error</u>&nbsp;-&nbsp;" + errMsg));' }

]

end

