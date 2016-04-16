##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ASPilot-Cart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-08
version "0.1"
description "Before you spend thousands on an E-Commerce site, check out our feature rich web site and e-commerce/shopping cart solution. The power of Enterprise, the simplicity of basic carts & the usefulness you expect."
website "http://www.pilotcart.com/"

# Google results as at 2010-11-08 #
# 51 for "Powered by Pilot Cart V" -vulnerabilities

# Dorks #
dorks [
'"Powered by Pilot Cart V" -vulnerabilities'
]



matches [

# Copyright text
{ :regexp=>/<meta name="copyright" content="Pilot Cart, Copyright 2003-[0-9]{4} Scarab Media dba ASPilot.com - All Rights Reserved Worldwide.">/ },

# Version Detection # Powered by text
{ :version=>/<a[^>]*href="http:\/\/www.PilotCart.com[^>]*>Powered by Pilot[^>]*Cart V.[\s]*([\d\.]+)<\/a>/i },
{ :version=>/Powered By[^<]*<a[^>]*href="http:\/\/www.aspilot.com[^>]*>Pilot[^>]*Cart V.[\s]*([\d\.]+)<\/a>/i },


]

end

