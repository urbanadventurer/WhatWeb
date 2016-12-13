##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Google-Webmaster-Verify" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "This plugin identifies the verify meta tag for Google Webmaster verification. This may be useful for tracking a webmaster across multiple domains."



# Matches #
matches [

# Meta Verify
{ :string=>/<meta name="(google-site-verification|verify-v1)"[^>]+content="([^"^>]+)"[\s]*[\/]?>/i, :offset=>1 },

]

end


