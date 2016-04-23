##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BusinessSpace" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-12
version "0.1"
description "BusinessSpace community"

# 15 results for "powered by BusinessSpace" @ 2010-08-12
# 22 results for inurl:"blogs_all_in_community" @ 2010-08-12


matches [

# Admin Page
{ :text=>'  <title>Login to our community network!</title>' },

# Footer
{ :text=>'				&copy; BusinessSpace			</div>' },

{ :text=>'This is a place for people building a circle of professional contacts, open to sharing new business opportunities, and looking to fully promote and showcase their capabilities." />' }

]

end

