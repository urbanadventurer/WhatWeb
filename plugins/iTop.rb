##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iTop" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-24
version "0.1"
description "IT Operations Portal (iTop): a complete open source, ITIL, web based service management tool including a fully customizable CMDB, a helpdesk system and a document management tool."
website "http://sourceforge.net/projects/itop/"

# Google results as at 2011-11-24 #
# 14 for intitle:"iTop Login"
#  1 for "Unable to read the configuration file" "Please check the access rights on this file"
#  1 for "Click here to ignore this warning and continue to run iTop."

# Dorks #
dorks [
'intitle:"iTop Login"'
]



# Matches #
matches [

# Error # Missing Config File
{ :text=>"<p><b>Error</b>: Unable to read the configuration file: 'config-itop.php'. Please check the access rights on this file.</p>" },

# Error # Writeable Config File
{ :text=>"<p><b>Security Warning</b>: the configuration file 'config-itop.php' should be read-only.</p><p>Please modify the access rights to this file.</p>" },

# ./pages/UI.php # Login Page # Title
{ :text=>'<title>iTop Login</title>' },

# ./pages/UI.php # Login Page # Version Detection
{ :version=>/<div id="login-logo"><a href="http:\/\/www\.combodo\.com\/itop"><img title="iTop [^\s]+ ([^\s^"]+)" src="\.\.\/images\/itop-logo/ },

]

end

