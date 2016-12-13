##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SazCart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-22
version "0.1"
description "SazCart is a simple & powerful shopping cart script. With SazCart you can quickly and easily setup an online store. Then customize it to exactly how you want it to work & look."
website "http://www.sazcart.com/"

# 24 results for "powered by SazCart" @ 2010-08-22

# Dorks #
dorks [
'"powered by SazCart"'
]



matches [

# Default title
{ :regexp=>/[^&]+&raquo; Powered by SazCart<\/title>/ },

# License Agreement (extract):
# Full License to remove "Powered by SazCart" in the browser title and "Powered by SazCart - Copyright © 2005 SazCart.com" text per domain: $29.95 (Subject to change without notice) 
{ :text=>'<a href="http://www.sazcart.com">Powered by SazCart</a> | <a href="http://www.sazcart.com">Copyright &#169; 2005 - 2006 SazCart.com</a>  </div>' },

]

end

