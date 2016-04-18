##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-17 # Andrew Horton
# Updated description, added website, and changed name to ComersusCart
##
# Version 0.2
# removed :name and :certainty=>100

Plugin.define "ComersusCart" do
author "Andrew Horton"
version "0.3"

description "ComersusCart is an open-source shopping cart using ASP. Comersus is an active server pages software for running a professional store, seamlessly integrated with the rest of your web site. Comersus Cart is free and it can be used for commercial purposes. Full source code included and compatible with Windows and Linux Servers."
website "http://www.comersus.com/"

#<meta NAME="DESCRIPTION" CONTENT="Powered by Comersus http://www.comersus.com">
#<title>Tarkenton Sports, Inc. Powered by Comersus ASP Shopping Cart Open Source - http://www.comersus.com - http://www.1aspshoppingcart.com</title>
# <a href="comersus_showCart.asp">
# <a href="comersus_dynamicIndex.asp">Home</a>  

#<title>specialequipment Powered by Comersus ASP Shopping Cart Open Source - http://www.comersus.com - http://www.1aspshoppingcart.com</title>
# <meta NAME="DESCRIPTION" CONTENT="Powered by Comersus http://www.comersus.com - ASP shopping cart software for Windows and Linux with Access, SQL Server or mySQL - easy to configure, Open Source and Free">
# Powered by <a href="asp_shopping_cart_download.html">Comersus</a> 4.36 Sophisticated ASP Shopping Cart Open Source</b>

matches [
{:regexp=>/<meta NAME="DESCRIPTION" CONTENT="Powered by Comersus http:\/\/www.comersus.com">/i },
{:regexp=>/<title>[^<]*Powered by Comersus ASP Shopping Cart Open Source[^<]*<\/title>/i },
{:regexp=>/<a href="[^"]*comersus_showCart.asp">/i },
{:regexp=>/Powered by <[^>]*>Comersus<\/a>/i }
]

end

