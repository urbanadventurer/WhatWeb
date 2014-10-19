##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ad-Network-Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-11
version "0.1"
description "The ad network script is a comprehensive solution to let you start your own professional ad network website. The script comes with bells and whistles to make you start and run your ad network website and to monitor the daily sales and delivery of ads on regular basis."
website "http://www.kaonsoftwares.com/ad-network-script.html"

# Google results as at 2010-10-11 #
# 32 for "Web Administration Panel" "by Kaon Softwares. All Rights Reserved."

# Dorks #
dorks [
'"Web Administration Panel" "by Kaon Softwares. All Rights Reserved."'
]



matches [

# Version detection # Admin page # Powered by text
{ :version=>/<td width="100%" height="33" bgcolor="#ED7900" class="copyright">&copy; Web Administration Panel .v([\d\.]+) by <a href="http:\/\/www.kaonsoftwares.com\/" class="copyright" target="_blank">Kaon Softwares<\/a>. All Rights Reserved.<\/td>/ },

# Version detection # Admin page # Powered by text
{ :version=>/<td height="70%" valign="bottom" align="right"><font face="verdana" size="1" color="gray">&copy; Web Administration Panel .v([\d\.]+) by <a href="http:\/\/www.kaonsoftwares.com\/" class="" target="_blank">Kaon Softwares<\/a>. All Rights Reserved.<\/font><\/td>/ },

]

end

