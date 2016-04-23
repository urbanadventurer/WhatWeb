##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SpamTitan" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-17
version "0.1"
description "SpamTitan Anti Spam is a complete software solution to email security offering protection from Spam, Viruses, Trojans, Phishing and unwanted content."
website "http://www.spamtitan.com/products/"

# 212 for intitle:"SpamTitan" "Language" "Czech (Czech)" "German (German)" "English (English)" "Japanese (Japanese)" "Password" "Email Address"

# Dorks #
dorks [
'intitle:"SpamTitan" "Language" "Czech (Czech)" "German (German)" "English (English)" "Japanese (Japanese)" "Password" "Email Address"'
]



# Matches #
matches [

# ./imgs/logo.gif
{ :url=>"/imgs/logo.gif", :md5=>"ab662b52fe52fa13aa13574efa7f490f" },

# ./imgs/favicon.ico
{ :url=>"/imgs/favicon.ico", :md5=>"f9015ac89e34faefe9b4df73901462d9" },

# Login Page # StyleSheet
{ :regexp=>/<link rel="stylesheet" type="text\/css" href="\/?styles\/spamtitan(\.[\d]{10})?\.css" title="SpamTitanCSS2">/ },

# Login Page # Logo HTML
{ :text=>'<table class="lhead"><tr><td class="img"><img src="/imgs/logo.gif" alt="SpamTitan Logo"></td></tr></table></div>' },

]

end

