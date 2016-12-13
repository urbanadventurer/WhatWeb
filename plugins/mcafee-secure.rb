##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "McAfee-Secure" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "McAfee Secure sites apparently help keep you safe from identity theft, credit card fraud, spyware, spam, viruses and online scams"
website "http://www.mcafeesecure.com/"



# Matches #
matches [

{ :string=>/<a target="?_blank"? href="https?:\/\/www\.(mcafeesecure|scanalert)\.com\/RatingVerify\?ref=([^"]+)"[^>]*>[\s]*<img/i, :offset=>1 },

]

end

