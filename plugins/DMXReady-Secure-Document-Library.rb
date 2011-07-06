##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DMXReady-Secure-Document-Library" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-06
version "0.1"
description "DMXReady Secure Document Library secures files so that only registered members can access and download them. - Homepage: http://www.dmxready.com/?product=secure-document-library"

# Google results as at 2011-07-06 #
# 56 for inurl:inc_securedocumentlibrary.asp

# Dorks #
dorks [
'inurl:inc_securedocumentlibrary.asp'
]

# Examples #
examples %w|
demo.dmxready.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
www.synqnet.org/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
www.trinityvillas.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
sawcertified.org/applications/secureDocumentLibrary/inc_securedocumentlibrary.asp
www.strokenetstaff.net/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
s15349149.onlinehome-server.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
www.traininghighway.org.uk/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
www.masonicleadership.org/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
www.specialkidscare.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
www.beca-aba.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
bahcs.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
www.fourthquadrantassetmanagement.com/applications/securedocumentlibrary/inc_securedocumentlibrary.asp
https://www.regenmg.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
www.quinsigamondlodge.org/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
www.eotj.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
www.aws-errata.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
https://www.ftl-inc.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
legacy.minntech.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
srcwwportal.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
www.psireseller.com/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
www.olivebranchmasons.org/applications/SecureDocumentLibrary/inc_securedocumentlibrary.asp
|

# Matches #
matches [

# Forgot password link
{ :regexp=>/<a href="[^"]*\/applications\/[sS]ecureDocumentLibrary\/inc_securedocumentlibrary\.asp\?show=sendpassword">Forget Password\?<\/a>/ },

# Form HTML
{ :regexp=>/<form action="[^"]*\/applications\/SecureDocumentLibrary\/inc_securedocumentlibrary\.asp" method="POST" name="login" onSubmit="YY_checkform\('login','entity_username','#q','0','Please provide username','entity_password','#q','0','Please provide password'\);return document.MM_returnValue"/i },

]

end

