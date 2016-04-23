##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Squirrelcart" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-15
version "0.1"
description "Squirrelcart PHP Shopping Cart software - Requires PHP and MySQL"
website "http://www.squirrelcart.com/"

# ShodanHQ reuslts as at 2012-06-15 #
# 274 for SC_referer SC_referral_date

# Google results as at 2012-06-15 #
# 238 for "Powered by Squirrelcart" "PHP Shopping Cart Software
#  57 for intitle:"Squirrelcart" intitle:"Control Panel" "Username" "Password"

# Dorks #
dorks [
'"Powered by Squirrelcart" "PHP Shopping Cart Software',
'intitle:"Squirrelcart" intitle:"Control Panel" "Username" "Password"'
]



# Matches #
matches [

# Powered by link
{ :text=>'<div class="sc_link">Powered by <a target="_blank" href="http://www.squirrelcart.com/php_shopping_cart.php">Squirrelcart &copy; PHP Shopping Cart Software</a></div>' },

# HTML Comment
{ :text=>'<!-- Template: price_html.tpl.php -->' },

# ./squirrelcart/ # Title # Version Detection
{ :version=>/<title>Squirrelcart v([^\s]+) Control Panel<\/title>/ },

# Set-Cookie # SC_referer
{ :search=>"headers[set-cookie]", :regexp=>/SC_referer=/},

# Set-Cookie # SC_referral_date
{ :search=>"headers[set-cookie]", :regexp=>/SC_referral_date=[\d]{4}\-[0-1][\d]\-[0-3][\d]\+/ },

]

end

