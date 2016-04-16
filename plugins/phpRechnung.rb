##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpRechnung" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.1"
description "phpRechnung is easy-to-use Web-based multilingual accounting software"
website "http://www.loenshotel.de/phpRechnung/"

# 4 results for phpRechnung "Edy Corak . All rights reserved." @ 2010-12-28

# Dorks #
dorks [
'phpRechnung "Edy Corak . All rights reserved."'
]



matches [

# Powered by link
{ :text=>"<a class='slink' title='phpInvoice Home' href='http://www.ecorak.de/phpRechnung/' target='_blank'>" },

# Version detection # Title
{ :version=>/<title>phpRechnung ([^-]+) - Login<\/title>/ },
{ :version=>/<title>phpInvoice ([^-]+) - Login<\/title>/ },

]

end


