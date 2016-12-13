##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-17 # Andrew Horton
# Added description
##
Plugin.define "PHP-Update" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.2"
description "Open-source Content Management System. Homepage used to be http://www.php-update.co.uk"

# 99 results for "powered by PHP-Update"

# Dorks #
dorks [
'"powered by PHP-Update"'
]



matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.php-update.co.uk" target="_blank">PHP-Update</a>' },

{ :regexp=>/Powered by <a href=[^>]*http:\/\/www.php-update.co.uk[^>]*>PHP[\ \-]*Update<\/a>/ },

{ :regexp=>/>Powered by PHP-Update<\/a>/i },

{ :text=>'<a href="http://www.php-update.co.uk">Powered by PHP-Update </a>' },

]

end

