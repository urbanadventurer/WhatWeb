##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-Hosting-Directory" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-10
version "0.1"
description "PHP Hosting Directory"
website "http://www.jnshosts.com/php-hosting-directory.html"

# Google results as at 2010-10-10 #
# 17 for "powered by PHP Hosting Directory 2.0" -Vulnerability

# Dorks #
dorks [
'"powered by PHP Hosting Directory 2.0" -Vulnerability'
]



# Matches #
matches [

# Version detection # Default title
{:version=>/<title>PHP Hosting Directory ([\d\.]+) Powered by JnSHosts\.com<\/title>/ },

# Version detection # Powered by text
{:version=>/<a href="http:\/\/www.jnshosts.com\/php-hosting-directory-([\d\.]+).php"[^>]+>PHP Hosting Directory<\/a>/ },

# Version detection # Default HTML
{:version=>/<font size="6"><b>PHP Hosting Directory ([\d\.]+)<\/b><\/font>/ },

]


end

