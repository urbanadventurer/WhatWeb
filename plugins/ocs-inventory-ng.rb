##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OCS-Inventory-NG" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-20
version "0.1"
description "Open Computers and Software Inventory Next Generation - computer hardware management - http://www.ocsinventory-ng.org/en/"

# Google results as at 2011-10-20 #
# 63 for intitle:"OCS Inventory" +Ver +inurl:"index.php?av="

# Dorks #
dorks [
'intitle:"OCS Inventory" "Ver" inurl:"index.php?av="'
]



# Matches #
matches [

# Login Page # StyleSheet
{ :text=>"<LINK REL='StyleSheet' TYPE='text/css' HREF='css/ocsreports.css'>" },

# Login Page # Version Detection # Banner HTML
{ :version=>/<img src=image\/banner-ocs\.png><\/a><\/td><td width='33%' align='right'>[\s]+<b>Ver\. ([^&]+)&nbsp&nbsp&nbsp;<\/b>/ },

]

end

