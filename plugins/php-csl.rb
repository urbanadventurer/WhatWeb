##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-CSL" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-25
version "0.1"
description "PHP-CSL: Code Snippet Library. PHP-CSL is an online application written in PHP which enables authorised users to store and categorise code snippets."
website "http://www.php-csl.com/"

# 34 for "Powered by: PHP-CSL"

# Dorks #
dorks [
'"Powered by: PHP-CSL"'
]



# Matches #
matches [

# Meta Description
{ :text=>'<meta name="description" content="PHP Code Snippet Library stores all your code for you for easy access, runs on any PHP platform and does not require a database... easy to install and full of features.">' },

# HTML Comment
{ :text=>'<!-- Please note the credit message below is required if you want support -->' },

# Version Detection # Powered by link footer
{ :version=>/<td align="right" class="hdr">Powered by: <a href="http:\/\/www\.php-csl\.com\/" class="foot" title="PHP-CSL">PHP-CSL V([^<]+)<\/a>&nbsp;<\/td>/ },

]

end

