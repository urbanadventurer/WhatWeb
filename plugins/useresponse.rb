##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "UseResponse" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-06
version "0.1"
description "UseResponse is a fully customizable, open-source, self-hosted customer feedback software and support system"
website "http://www.useresponse.com/"

# Google results as at 2012-06-06 #
# 55 for "Enter your email (login) to get instructions to recover your password" "All Responses" "Powered by" inurl:"responses"

# Dorks #
dorks [
'"Enter your email (login) to get instructions to recover your password" "All Responses" "Powered by" inurl:"responses"'
]



# Matches #
matches [

# Powered by footer
{ :text=>'title="Customer Feedback Software, Community Support System" target="_blank" href="http://www.useresponse.com" class="popup-logo">' },

# HTML Comments
{ :regexp=>/<!-- DO NOT MODIFY (ABOVE|BELOW) THIS LINE UNLESS PURCHASED BRANDING REMOVAL -->/ },

# Form HTML
{ :text=>'<form id="system-form-registration" enctype="application/x-www-form-urlencoded" class="system-form-registration" accept-charset="utf-8"' },

]

end

