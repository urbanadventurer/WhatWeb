##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Price-Comparison-Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-11
version "0.1"
description "The price comparison script is a comprehensive solution to let you start your own professional price comparison website. The script comes with bells and whistles to make you start and run your price comparison website and keep it updated with the products and prices on regular basis."
website "http://www.kaonsoftwares.com/price-comparison-script.html"

# 32 results for "Web Administration Panel" "by Kaon Softwares. All Rights Reserved." @ 2010-10-11

# Dorks #
dorks [
'"Web Administration Panel" "by Kaon Softwares. All Rights Reserved."'
]



matches [

# Version detection # Admin page # Powered by text
{ :version=>/<td height="10%" valign="bottom" align="right"><font face="verdana" size="1" color="gray">&copy; Web Administration Panel .v([\d\.]+) by <a href="http:\/\/www.kaonsoftwares.com\/" class="" target="_blank">Kaon Softwares<\/a>. All Rights Reserved.<\/font><\/td>/ },

# Version detection # Admin page # Powered by text
{ :version=>/<td height="19" colspan="6" align="right"><font face="verdana" size="1" color="gray">&copy; Web Administration Panel .v([\d\.]+) by <a href="http:\/\/www.kaonsoftwares.com\/" class="" target="_blank">Kaon Softwares<\/a>. All Rights Reserved.<\/font><\/td>/ },

# Version detection # Admin page # Powered by text
{ :version=>/<td height="70%" valign="bottom" align="right"><font face="verdana" size="1" color="gray">&copy; Web Administration Panel .v([\d\.]+) by <a href="http:\/\/www.kaonsoftwares.com\/" class="" target="_blank">Kaon Softwares<\/a>. All Rights Reserved.<\/font><\/td>/ },

]

end

