##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Open-Freeway" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-05 
version "0.1"
description "Freeway is by far the largest and most fully featured Open Source eCommerce platform. It doesn't just sell products but extends to sell in some very fancy new ways and is very configurable."
website "http://www.openfreeway.org/"

# Dorks #
dorks [
'"Copyright * Zacware" "Welcome Guest" "Advanced Search" "Shopping Cart" "Checkout"'
]



# Matches #
matches [

{ :certainty=>75,
:ghdb=>'+"Copyright * Zacware" +"Welcome Guest" +"Advanced Search" +"Shopping Cart" +"Checkout"'
},

{:name=>'default html',
:text=>'<body marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" onLoad="javascript:move_cart()">'
}

]

def passive
        m=[]
	m << {:name=>"fEcom Cookie", :certainty=>75 } if @headers["set-cookie"] =~ /fEcom=/
        m
end

end

