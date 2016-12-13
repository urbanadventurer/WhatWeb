##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IBM-Cognos" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "IBM Cognos - Business Intelligence and Financial Performance Management"
website "http://www-01.ibm.com/software/au/data/cognos/"

# Google results as at 2012-08-26 #
# 47 for inurl:"cognos8/cgi-bin/cognos.cgi"

# Dorks #
dorks [
'inurl:"cognos8/cgi-bin/cognos.cgi"'
]



# Matches #
matches [

# /cognos8/
{ :text=>'<meta name="Trademark" content="Licensed Material - Property of IBM Corp. IBM, the IBM logo, and Cognos are trademarks of IBM Corp., registered in many jurisdictions worldwide."/>' },

# URL Pattern
{ :ghdb=>'inurl:"cognos/cgi-bin/cognos.cgi"' },
{ :ghdb=>'inurl:"cognos8/cgi-bin/cognos.cgi"' },

# Footer
{ :text=>'<td nowrap class="copyright" id="loginLegalContainer">Licensed Material - Property of IBM Corp.<br>(C) Copyright IBM Corporation and its licensors 2005, 2009.<br>IBM, the IBM logo, and Cognos are trademarks of IBM Corp., registered in many jurisdictions worldwide.</td>' },

]

end

