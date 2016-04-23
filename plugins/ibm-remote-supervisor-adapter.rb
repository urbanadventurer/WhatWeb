##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IBM-Remote-Supervisor-Adapter" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-15
version "0.1"
description "IBM Remote Supervisor Adapter (RSA) is the out-of-band management interface card optional on most IBM x86-based servers."
website "https://www-947.ibm.com/support/entry/portal/docdisplay?lndocid=MIGR-50116"

# More Info #
# https://en.wikipedia.org/wiki/IBM_Remote_Supervisor_Adapter

# ShodanHQ results as at 2012-02-15 #
# 568 for private/testcookie.ssi SESSID



# Matches #
matches [

# /private/userlogin.ssi # Redirect Page
{ :text=>'<HTML><BODY bgcolor="#FFFFFF"><SCRIPT language="javascript1.2"> top.location = "/"; </SCRIPT> </BODY> </HTML>' },

# Frameset # /private/userlogin_logo.ssi
{ :regexp=>/<FRAME scrolling="no" src="\/private\/userlogin_logo\.ssi(\?SESSID=[a-f\d]{32})?" NAME="logo_frame" marginwidth=0 marginheight=0 frameborder=no framespacing=0 noresize ALIGN="/ },

# Frameset # /private/userlogin_body.ssi
{ :regexp=>/<FRAME src="\/private\/userlogin_body\.ssi(\?SESSID=[a-f\d]{32})?" NAME="userlogin_body" marginwidth=20/ },

# /private/userlogin_logo.ssi # Banner HTML
{ :url=>"/private/userlogin_logo.ssi", :text=>'<IMG SRC="banner.jpg" WIDTH=110 HEIGHT=53 ALT="banner" >' },

# Location Header
{ :search=>"headers[location]", :regexp=>/https?:\/\/[^\/]+\/private\/testcookie\.ssi\?SESSID=[a-f\d]{32}/ },

]

end

