##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Huawei-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-03
version "0.1"
description "Huawei Firewall"
website "http://www.huawei.com/en/products/data-communication/network-security/firewall/index.htm"

# ShodanHQ results as at 2012-06-03 #
# 9,018 for Eudemon Server

# Google results as at 2012-06-03 #
# 10 for intitle:"Web Admin login" "Password" "Huawei Technologies Co., Ltd."

# Dorks #
dorks [
'intitle:"Web Admin login" "Password" "Huawei Technologies Co., Ltd."'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!--Modify by wangxiangguang 2006-9-29 for BYDD15857 Begin -->' },
{ :text=>'<!--Modify by wangxiangguang 2006-9-29 for BYDD15857 End -->' },

# username field
{ :text=>'<input type="text" onpaste="checkPaste(this,\'012\')" name="username" id="username" maxlength=' },

# Copyright Footer # Year Detection
{ :string=>/<div align="center">Copyright \(c\) Huawei Technologies Co\., Ltd\. 2005-(20[\d]{2})\. All rights reserved\. <\/div>/ },
{ :string=>/<div align="center">Copyright \(c\) 2005-(20[\d]{2}) Huawei Technologies Co\., Ltd\.<\/div><\/td>/ },

# Server # Eudemon Model # Version Detection
{ :search=>"headers[server]", :version=>/^Eudemon Server ([^\s]+)$/, :model=>"Eudemon" },

]

end

