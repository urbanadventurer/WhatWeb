##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DMXReady-Secure-Document-Library" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-06
version "0.1"
description "DMXReady Secure Document Library secures files so that only registered members can access and download them."
website "http://www.dmxready.com/?product=secure-document-library"

# Google results as at 2011-07-06 #
# 56 for inurl:inc_securedocumentlibrary.asp

# Dorks #
dorks [
'inurl:inc_securedocumentlibrary.asp'
]



# Matches #
matches [

# Forgot password link
{ :regexp=>/<a href="[^"]*\/applications\/[sS]ecureDocumentLibrary\/inc_securedocumentlibrary\.asp\?show=sendpassword">Forget Password\?<\/a>/ },

# Form HTML
{ :regexp=>/<form action="[^"]*\/applications\/SecureDocumentLibrary\/inc_securedocumentlibrary\.asp" method="POST" name="login" onSubmit="YY_checkform\('login','entity_username','#q','0','Please provide username','entity_password','#q','0','Please provide password'\);return document.MM_returnValue"/i },

]

end

