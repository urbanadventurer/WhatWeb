##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "reCAPTCHA" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-15
version "0.1"
description "reCAPTCHA is a free CAPTCHA service that helps to digitize books, newspapers and old time radio shows."
website "http://www.google.com/recaptcha"



# Matches #
matches [

# NoScript iframe
{ :regexp=>/<noscript>[\s]*<iframe src="http:\/\/www\.google\.com\/recaptcha\/api\/noscript\?k=/ },

]

end


