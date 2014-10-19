##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Open-Realty" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "Open-Realty is a FREE commercial web based real estate listing management application."
website "http://www.open-realty.org/"

# 207 results for "powered by Open-Realty" @ 2010-10-13

# Dorks #
dorks [
'"powered by Open-Realty"'
]



matches [

# Version detection # Default title
{ :version=>/<title>Open-Realty ([\d\.]+) - [^<]+<\/title>/ },

# Meta generator
{ :text=>'<meta name="Generator" content="Open-Realty" />' },

# Powered by text
{ :text=>'Powered by <a href="http://www.open-realty.org"><b>Open-Realty</b></a>' },
{ :text=>'Powered by <a href="http://open-realty.org" title="Open-Realty&reg;" rel="external">Open-Realty</a>' },

# HTML comment
{ :text=>'<!--Open-Realty is distributed by Transparent Technologies and is Licensed under the Open-Realty License. See http://www.open-realty.org/license_info.html for more information.-->' },

]

end

