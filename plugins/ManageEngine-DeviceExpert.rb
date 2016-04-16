##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ManageEngine-DeviceExpert" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-24
version "0.1"
description "DeviceExpert is a web.based, multi vendor network change, configuration and compliance management (NCCCM) solution for switches, routers, firewalls and other network devices."
website "http://www.manageengine.com/products/device-expert/"

# Google results as at 2012-03-24 #
# 1 for intitle:"ManageEngine DeviceExpert" "Best viewed in IE 7.0 and above"

# Dorks #
dorks [
'intitle:"ManageEngine DeviceExpert" "Best viewed in IE 7.0 and above"'
]



# Matches #
matches [

# AUTHRULE_NAME
{ :text=>'<input type="hidden" name="AUTHRULE_NAME" id="AUTHRULE_NAME" value="Authenticator">' },

# JavaScript
{ :text=>'<SCRIPT language="javascript" src="/javascript/deviceexpert.js"></SCRIPT>' },

# / or /index.html # Redirect Page
{ :md5=>"f159ea86b41bc4908398a2d27f333df5" },

]

end

