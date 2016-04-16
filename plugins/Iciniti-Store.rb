##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Iciniti-Store" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-09
version "0.1"
description "Iciniti Store is a highly customizable shopping cart that is fully integrated with the Sage Accpac ERP accounting system."
website "http://www.iciniti.com"

# This plugin requires more matches

# Google results as at 2012-03-09 #
# 47 for inurl:"logon_forgot_password.aspx"

# Dorks #
dorks [
'inurl:"logon_forgot_password.aspx"'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- START (content_stylesheet.inc) -->' },

]

end

