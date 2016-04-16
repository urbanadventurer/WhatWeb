##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "EZCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.2"
description "Building your own website is easy with the EZ Websites Builder"
website "http://www.ezwebsites.com.au"

# Google results as at 2010-08-28 #
# 20 for "powered by EZCMS" -Vulnerabilities

# Dorks #
dorks [
'"powered by EZCMS" -Vulnerabilities'
]



# Matches #
matches [

# Powered by text
{ :text=>'        <td align="right"><a href="http://www.ezwebsites.com.au" class="credits">Site Powered by EZCMS</a></td>' },

# Admin page html
{ :text=>'      <td width="100%" align="left" valign="bottom" background="images/headerbg.png"><div align="right"><img src="images/headerright.png" border="0"></div></td>' },

# Admin logo
{ :md5=>'3f9861ab3124420694f663c82bf770ab', :url=>'admin/images/headerright.png' },

# Default title
{ :text=>'<title>EZCMS Content Management System</title>' },

# Version Detection # Admin page
{ :version=>/<center><strong>EZCMS ([\d\.]+) / },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/ezcms.eztechhelp.com\/">EZCMS ([\d\.]+)<\/a>/ },

]

end

