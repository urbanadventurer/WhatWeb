##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OrangeHRM" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-18
version "0.1"
description "OrangeHRM - Open Source Human Resource Management Software (HRMS)"
website "http://www.orangehrm.com/"

# ShodanHQ results as at 2012-05-18 #
# 5 for symfony/web/index.php/auth/login

# Google results as at 2012-05-18 #
# 242 for "OrangeHRM ver" "OrangeHRM Inc." "All rights reserved."
#  25 for "OrangeHRM ver" "OrangeHRM Inc." "All rights reserved." intitle:"OrangeHRM Web Installation Wizard"
#  13 for inurl:"symfony/web/index.php/auth/login"

# Dorks #
dorks [
'"OrangeHRM ver" "OrangeHRM Inc." "All rights reserved."'
]



# Matches #
matches [

# Install Page # Heading # Version Detection
{ :version=>/<div id="content">\s+<h2>Welcome to the OrangeHRM ver ([^\s]+) Setup Wizard<\/h2>/ },

# Install Page # Footer # Web Installation Wizard Version Detection
{ :module=>/<div id="footer"><a href="http:\/\/www\.orangehrm\.com" target="_blank" tabindex="[^"^>]*">OrangeHRM<\/a> (Web Installation Wizard ver [^\s]+) &copy; OrangeHRM Inc/ },

# Login Page # input hdnUserTimeZoneOffset
{ :text=>'<input type="hidden" name="hdnUserTimeZoneOffset" id="hdnUserTimeZoneOffset" value="0" />' },

# Login Page # Footer # Version Detection
{ :version=>/<div id="divFooter" >\s+<span id="spanCopyright">\s+<a href="http:\/\/www\.orangehrm\.com" target="_blank">OrangeHRM<\/a>\s+ver ([^&]+) &copy; OrangeHRM Inc/ },

# Login Page # Footer # Version Detection # Old Versions # Probably < 2.x
{ :version=>/<td align="center"><a href="http:\/\/www\.orangehrm\.com" target="_blank">OrangeHRM<\/a> ver ([^\s]+) &copy; OrangeHRM Inc/ },

]

end

